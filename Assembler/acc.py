import json
import sys

if(len(sys.argv) == 3):
    srcpath = sys.argv[1]
    dstpath = sys.argv[2]
elif(len(sys.argv) == 1):
    srcpath = 'relPrime.acc'
    dstpath = 'relPrime.o'
else:
    print("Userage: python acc.py [input file] [output file]")
    exit()

global_addr = 0xFF00
text_addr = 0x0000
ra = 0xFFFE
magicio = 0xFFFC
label_dict = {"ra": 127, "io": 126}

def getvalue(address):
    return int((address - 0xFF00)/2)

print("Loading the opcode table")
with open('assember_table.json', "r") as infile:
    opcode_dict = json.loads(infile.read())
    print(opcode_dict)

with open(srcpath, 'r') as codefile:
    # make the label-address table
    for line in codefile:
        instruction = line.split()
        #print(instruction)
        if(len(instruction) == 3 and ':' in instruction[0]):
            label = instruction[0].lower().split(':')[0]
            #print(label)
            if(label in label_dict):
                print("[Fatal Error] double defined lable: %s." % label)
                raise ValueError("Double Defined lable: %s." % label)
            else:
                label_dict[label] = text_addr;
        text_addr+=2
      
        if(text_addr > 0x00FE):
            print("[Fatal Error] Text Data Overflow in line %d: %04x." 
                  % (text_addr - 0x0000)/2, text_addr)
            raise ValueError("[Fatal Error] Text Data Overflow in line %d: %04x." 
                  % (text_addr - 0x0000)/2, text_addr)

    print("[Success] Finished Addressing all Lables")
    print(label_dict)


with open(srcpath, 'r') as codefile, open(dstpath, 'w') as ofile, open("%sd" % dstpath, 'w') as dfile:
    text_addr = 0x0000
    # assemble the code into machine code
    for line in codefile:
        instruction = line.split()
        length = len(instruction)
        # translate the last arguement (must be a label or immediate)
        immediate = instruction[length - 1].lower()
        if(immediate.lstrip('+-').isdigit() == False):
            if(immediate in label_dict):
                immediate = label_dict[immediate]
            else:
                label_dict[immediate] = getvalue(global_addr)
                immediate = getvalue(global_addr)
                global_addr+=2
        elif(immediate.lstrip('+').isdigit() == True):
            immediate = int(immediate)
        else:
            immediate = int(immediate) + 256

        # translate the opcode
        opcode = instruction[0].lower()
        reserved = '000'
        # if more than 3 args or fewer than 2 
        if(length == 3):
            if(':' in opcode):
                opcode = instruction[1].lower()
            else:
                #IA type
                
                reserved = int((immediate - text_addr - 2)/2)
                if(reserved > 0b111):
                    print("[Fatal Error] Instruction Immediate Overflow in line %d: %s." 
                          % (text_addr - 0x0000)/2, line)
                    raise ValueError("[Fatal Error] Instruction Immediate Overflow in line %d: %s." 
                          % (text_addr - 0x0000)/2, line)
                reserved = "{:03b}".format(reserved)          
                immediate = instruction[1].lower()
                if(immediate.lstrip('+-').isdigit() == False):
                    if(immediate in label_dict):
                        immediate = label_dict[immediate]
                    else:
                        label_dict[immediate] = getvalue(global_addr)
                        immediate = getvalue(global_addr)
                        global_addr+=2
        elif(length != 2):
            print("[Fatal Error] Wrong format in line %d: %s." 
                  % ((text_addr - 0x0000)/2, line))
            raise ValueError("[Fatal Error] Wrong format in line %d: %s." 
                  % ((text_addr - 0x0000)/2, line))
    
        if(opcode in opcode_dict):
            opcode = opcode_dict[opcode]
        else:
            print("[Fatal Error] Wrong format in line %d: %s." 
                  % ((text_addr - 0x0000)/2, line))
            raise ValueError("[Fatal Error] Wrong format in line %d: %s." 
                  % ((text_addr - 0x0000)/2, line))
    
        # write into the obj file
        #print(" 0x{:04x}:  {} {:08b} {}\t {}".format(text_addr, opcode, immediate, reserved, line))
        dfile.write(" 0x{:04x}:  {} {:08b} {}\t {}".format(text_addr, opcode, immediate, reserved, line))
        #print("{}{:08b}{}".format(opcode, immediate, reserved))
        ofile.write("{:04x}\n".format(int("{}{:08b}{}".format(opcode, immediate, reserved), 2)))
        text_addr+=2
        # check if the data overflow
        # 0xFFFE is reserved for return address
        if(global_addr > 0xFFFC):
            print("[Fatal Error] Global Data Overflow in line %d: %04x." 
                  % (text_addr - 0x0000)/2, global_addr)
            raise ValueError("[Fatal Error] Global Data Overflow in line %d: %04x." 
                  % (text_addr - 0x0000)/2, global_addr)
    
    print("[Success] Finished Assembling all codes")
    print(label_dict)




      
    
