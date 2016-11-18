COMMENT = ';' # set the comment delimiter

opcodes = {
    'load' : '000',
    'store' : '001',
    'add' : '010',
    'match' : '011',
    'lt' : '100',
    'dist' : '101',
    'lsl' : '110000',
    'lsr' : '110001',
    'incr' : '110010',
    'and' : '110011',
    'eqz' : '110100',
    'zero' : '110101',
    'halt' : '110111',
    'bno' : '1110',
    'bof' : '1111'
    }

branchMap = {}
instrCount = 0

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~ HELPER FUNCTIONS ~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

def extractTokens( line ):
    #remove comments from the line
    if(line.find(COMMENT) != -1):
        line = line[:line.find(COMMENT)] 

    #remove commas and split line into tokens
    tokens = line.replace(',','').split()
    return tokens

def extractOpcode( tokens ):
    #check if line contains an opcode
    if( tokens[0] in opcodes ):
        return opcodes[tokens[0]]
    else:
        return ''

def extractReg( tokens, argNum ):
    if( argNum < len(tokens) - 1 ):
        #expecting arguments in indeces 1 - 2
        #expecting arguments to be format $rx where x is an integer
        
        binArg = bin(int(tokens[argNum + 1][2:]))[2:]
        while( len(binArg) < 3 ):
            #append additional 0s until it's 3 bits
            binArg = '0' + binArg
        return binArg
    else:
        return ''

def processBranchInstruction( tokens, currCount ):
    if( len(tokens) == 1 and ':' in tokens[0] ):
        branchMap[tokens[0][:tokens[0].index(':')]] = currCount
        #valid branch instruction
        return 1
    elif( len(tokens) in range(2, 4) or (len(tokens) == 1 and tokens[0] == 'halt') ):
        #valid non-branch instruction
        return 0
    else:
        return -1 #non-valid line

def extractBranchTarget( tokens ):
    branchTarget = ''
    if( tokens[1] in branchMap ):
        numBits = 5
        diff = branchMap[tokens[1]] - instrCount
        if( diff < 0 ):
            diff = abs(diff)
            branchTarget = bin(abs(diff - (1 << numBits)))[2:]
        else:
            branchTarget = bin(diff)[2:]
            
        for b in range(numBits - len(branchTarget)):
            branchTarget = '0' + branchTarget

        return branchTarget
    else:
        print('Couldn\'t find branch target for ', tokens[1])
        return ''

#if the line is valid, converts assembly into binary
def assemble( tokens ):
    binLine = ''
    if( len(tokens) in range(2, 4) ):
        opcode = extractOpcode(tokens)
        if( opcode == '' ):
            return '' # invalid instruction but has valid length

        binLine += opcode
        if( tokens[0] != 'bno' and tokens[0] != 'bof' ):
            for r in range(len(tokens)-1):
                binLine += extractReg(tokens, r)
        elif( tokens[0] == 'bno' or tokens[0] == 'bof' ):
            target = extractBranchTarget(tokens)
            if( target != '' ):
                binLine += target
            else:
                return '' # branch instruction but was invalid
        else:
            print('invalid instruction ', tokens)
            exit()
    elif( len(tokens) == 1 and tokens[0] == 'halt' ):
        binLine = extractOpcode(tokens) + '000'
        

    return binLine

#~~~~~~~~~~~~~#~~~~~~~~~~~~~#
#~~~~~~~~~~~~#~#~~~~~~~~~~~~#
#~~~~~~~~~~~~~#~~~~~~~~~~~~~#
        




#~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~ MAIN PROGRAM ~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~#

fileName = input("Instruction file name: ")
try:
    instrFile = open(fileName, "r")
except:
    print('Couldn\'t open file ', fileName)
    exit()

#find all branch labels and add to dictionary
for l in instrFile:
    tokens = extractTokens(l)
    if( processBranchInstruction(tokens, instrCount) == 0 ):
        instrCount += 1

print("Finished extracting branch labels")
print("Found", len(branchMap), "labels")

fileName = input("Binary code output file: ")
try:
    binFile = open(fileName, "w")
except:
    print('Couldn\'t open file ', fileName)
    exit()

#write header of .mif file
"""
binFile.write("DEPTH = " + str(instrCount) + ';\n')
binFile.write("WIDTH = 9;\n")
binFile.write("ADDRESS_RADIX = DEC;\n")
binFile.write("DATA_RADIX = BIN;\n")
binFile.write("CONTENT\n")
binFile.write("BEGIN\n")
"""

instrCount = 0
instrFile.seek(0,0)

#MAIN ASSEMBLY ALGORITHM
for l in instrFile:
    tokens = extractTokens(l)
    if(len(tokens) > 0):
        binLine = assemble(tokens)
        if( binLine != '' ):
            if( len(binLine) != 9 ):
                print('binLine is not 9 bits')
                exit()
                
            binFile.write(binLine + '\n')
            instrCount += 1
#end of file
#binFile.write("END;")

#close files
instrFile.close()
binFile.close()

print("Program finished assembling.")
print("Wrote", instrCount, "instructions.")

#~~~~~~~~~~~~~#~~~~~~~~~~~~~#
#~~~~~~~~~~~~#~#~~~~~~~~~~~~#
#~~~~~~~~~~~~~#~~~~~~~~~~~~~#

        

        
    
