#include "Assembler.h"
#include "SymbolTable.h"

#include <string>
#include<iostream>

using namespace std;

/**
 * Assembler constructor
 */
Assembler::Assembler() {
    // Your code here
}

/**
 * Assembler destructor
 */
Assembler::~Assembler() {
    // Your code here
}

/**
 * Assembler first pass; populates symbol table with label locations.
 * @param instructions An array of the assembly language instructions.
 * @param symbolTable The symbol table to populate.
 */
void Assembler::doFirstPass(SymbolTable* symbolTable, string instructions[], int numOfInst) {
    unsigned int line = 0;
    for (int i = 0; i < numOfInst; i++) {
        auto type = parseInstructionType(instructions[i]);
        if (type == L_INSTRUCTION) {
            string label = instructions[i].substr(1, instructions[i].length() - 2);
            symbolTable->addSymbol(label, line);
        }
        else if(type==A_INSTRUCTION||type==C_INSTRUCTION) {
            line++;
        }
    }
}

/**
 * Translates a set of instructions to machine code.
 * @param instructions An array of the assembly language instructions to be converted to machine code.
 * @param symbolTable The symbol table to reference/update.
 * @return A string containing the generated machine code as lines of 16-bit binary instructions.
 */
string Assembler::doSecondPass(SymbolTable* symbolTable, string instructions[], int numOfInst) {
    string result = "";
    for (int i = 0; i < numOfInst; i++) {
        string instruction = "";

        //get the op bit
        auto instructionType = parseInstructionType(instructions[i]);
        if (instructionType == A_INSTRUCTION) {
            instruction += "0";
            auto symbol = parseSymbol(instructions[i]);
            if (!isNumber(symbol)) {
                if (symbolTable->getSymbol(symbol) == -1) {
                    symbolTable->addSymbol(symbol, symbolTable->availableAddress);
                    symbolTable->availableAddress++;
                }
            }
            instruction += translateSymbol(parseSymbol(instructions[i]), symbolTable);
        }
        else if (instructionType == C_INSTRUCTION) {
            instruction += "111";
            instruction += translateComp(parseInstructionComp(instructions[i]));
            instruction += translateDest(parseInstructionDest(instructions[i]));
            instruction += translateJump(parseInstructionJump(instructions[i]));
        }
        else {
            continue;
        }
        result += instruction + "\n";
    }

    return result;
}

/**
 * Parses the type of the provided instruction
 * @param instruction The assembly language representation of an instruction.
 * @return The type of the instruction (A_INSTRUCTION, C_INSTRUCTION, L_INSTRUCTION, NULL)
 */
Assembler::InstructionType Assembler::parseInstructionType(string instruction) {
    if (instruction [0]=='@') {
        return A_INSTRUCTION;
    }
    else if(instruction[0] == '(') {
        return L_INSTRUCTION;
    }
    else {
        return C_INSTRUCTION;
    }
}

/**
 * Parses the destination of the provided C-instruction
 * @param instruction The assembly language representation of a C-instruction.
 * @return The destination of the instruction (A, D, M, AM, AD, MD, AMD, NULL)
 */
Assembler::InstructionDest Assembler::parseInstructionDest(string instruction) {
    instruction = trim(instruction);
    if (instruction.find('=') == instruction.npos) {
        return NULL_DEST;
    }
    else {
        auto pos = instruction.find('=');
        string dest = instruction.substr(0, pos);
        if (dest.length() == 1) {
            if (dest == "A") {
                return A;
            }
            else if(dest=="D") {
                return D;
            }
            else {
                return M;
            }
        }
        else if (dest.length() == 2) {
            if (dest == "AM") {
                return AM;
            }
            else if (dest == "AD") {
                return AD;
            }
            else {
                return MD;
            }
        }
        else {
            return AMD;
        }
    }
}

/**
 * Parses the jump condition of the provided C-instruction
 * @param instruction The assembly language representation of a C-instruction.
 * @return The jump condition for the instruction (JLT, JGT, JEQ, JLE, JGE, JNE, JMP, NULL)
 */
Assembler::InstructionJump Assembler::parseInstructionJump(string instruction) {
    instruction = trim(instruction);
    if (instruction.find(";") == string::npos) {
        return NULL_JUMP;
    }
    else {
        auto pos = instruction.find(";");
        if (pos == instruction.length() - 1 || instruction[pos + 1] != 'J') {
            return NULL_JUMP;
        }
        string jumpInstruction = instruction.substr(pos + 1);
        if (jumpInstruction == "JGT") {
            return JGT;
        }
        else if (jumpInstruction == "JGE") {
            return JGE;
        }
        else if(jumpInstruction == "JLE") {
            return JLE;
        }
        else if (jumpInstruction == "JLT") {
            return JLT;
        }
        else if (jumpInstruction == "JEQ") {
            return JEQ;
        }
        else if (jumpInstruction == "JNE") {
            return JNE;
        }
        else {
            return JMP;
        }
    }
}

/**
 * Parses the computation/op-code of the provided C-instruction
 * @param instruction The assembly language representation of a C-instruction.
 * @return The computation/op-code of the instruction (CONST_0, ... ,D_ADD_A , ... , NULL)
 */
Assembler::InstructionComp Assembler::parseInstructionComp(string instruction) {
    instruction = trim(instruction);
    auto compStart = instruction.find('=') == instruction.npos ? 0 : instruction.find('=')+1;
    auto compEnd = instruction.find(';') == instruction.npos ? instruction.length() - 1:instruction.find(';') - 1;
    auto length = compEnd - compStart + 1;
    instruction = instruction.substr(compStart, length);
    
    if (instruction=="0")
    {
        return CONST_0;
    }
    if (instruction == "1")
    {
        return CONST_1;
    }
    if (instruction == "-1")
    {
        return CONST_NEG_1;
    }
    if (instruction == "A") {
        return VAL_A;
    }
    if (instruction == "D") {
        return VAL_D;
    }
    if (instruction == "M") {
        return VAL_M;
    }
    if (instruction == "-M") {
        return NEG_M;
    }
    if (instruction == "-A") {
        return NEG_A;
    }
    if (instruction == "-D") {
        return NEG_D;
    }
    if (instruction == "!M") {
        return NOT_M;
    }
    if (instruction == "!A") {
        return NOT_A;
    }
    if (instruction == "!D") {
        return NOT_D;
    }
    if (instruction == "A+1"||instruction=="1+A") {
        return A_ADD_1;
    }
    if (instruction == "M+1"||instruction=="1+M") {
        return M_ADD_1;
    }
    if (instruction == "D+1"||instruction=="1+D") {
        return D_ADD_1;
    }
    if (instruction == "A-1") {
        return A_SUB_1;
    }
    if (instruction == "M-1") {
        return M_SUB_1;
    }
    if (instruction == "D-1") {
        return D_SUB_1;
    }
    if (instruction == "D+A"||instruction=="A+D") {
        return D_ADD_A;
    }
    if (instruction == "D+M"||instruction=="M+D") {
        return D_ADD_M;
    }
    if (instruction == "D-A") {
        return D_SUB_A;
    }
    if (instruction == "D-M") {
        return D_SUB_M;
    }
    if (instruction == "A-D") {
        return A_SUB_D;
    }
    if (instruction == "M-D") {
        return M_SUB_D;
    }
    if (instruction == "D&A"||instruction=="A&D") {
        return D_AND_A;
    }
    if (instruction == "D&M"||instruction=="M&D") {
        return D_AND_M;
    }
    if (instruction == "D|A"||instruction=="A|D") {
        return D_OR_A;
    }
    else {
        return D_OR_M;
    }
}

/**
 * Parses the symbol of the provided A/L-instruction
 * @param instruction The assembly language representation of a A/L-instruction.
 * @return A string containing either a label name (L-instruction),
 *         a variable name (A-instruction), or a constant integer value (A-instruction)
 */
string Assembler::parseSymbol(string instruction) {
    if (instruction[0] == '@') {
        return instruction.substr(1);
    }
    else {
        return instruction.substr(1, instruction.length() - 1);
    }
}

/**
 * Generates the binary bits of the dest part of a C-instruction
 * @param dest The destination of the instruction
 * @return A string containing the 3 binary dest bits that correspond to the given dest value.
 * enum class is as follows:
 *      A,
        D,
        M,
        AM,
        AD,
        MD,
        AMD,
        NULL_DEST
 */
string Assembler::translateDest(InstructionDest dest) {
    switch (dest) {
    case 0:
        return"100";
        break;
    case 1:
        return "010";
        break;
    case 2:
        return "001";
        break;
    case 3:
        return"101";
        break;
    case 4:
        return "110";
        break;
    case 5:
        return "011";
        break;
    case 6:
        return "111";
        break;
    default:
        return "000";
        break;
    }
}

/**
 * Generates the binary bits of the jump part of a C-instruction
 * @param jump The jump condition for the instruction
 * @return A string containing the 3 binary jump bits that correspond to the given jump value.
 * enum class is as follows:
 *      JLT,
        JGT,
        JEQ,
        JLE,
        JGE,
        JNE,
        JMP,
        NULL_JUMP
 */
string Assembler::translateJump(InstructionJump jump) {
    switch (jump) {
    case 0:
        return"100";
        break;
    case 1:
        return"001";
        break;
    case 2:
        return"010";
        break;
    case 3:
        return"110";
        break;
    case 4:
        return"011";
        break;
    case 5:
        return"101";
        break;
    case 6:
        return"111";
        break;
    default:
        return"000";
        break;
    }
}

/**
 * Generates the binary bits of the computation/op-code part of a C-instruction
 * @param comp The computation/op-code for the instruction
 * @return A string containing the 7 binary computation/op-code bits that correspond to the given comp value.
 */
string Assembler::translateComp(InstructionComp comp) {
    switch (comp) {
    // CONST_0
    case 0:
        return"0101010";
        break;
    // CONST_1
    case 1:
        return"0111111";
        break;
    //CONST_NEG_1,
    case 2:
        return"0111010";
        break;
    //VAL_A
    case 3:
        return"0110000";
        break;
     //VAL_M
    case 4:
        return "1110000";
        break;
    //VAL_D
    case 5:
        return "0001100";
        break;
    //NOT_A
    case 6:
        return "0110001";
        break;
    //NOT_M
    case 7:
        return "1110001";
        break;
    // NOT_D,
    case 8:
        return "0001101";
        break;
    //  NEG_A,
    case 9:
        return "0110011";
        break;
    //  NEG_M
    case 10:
        return"1110011";
        break;
    //  NEG_D
    case 11:
        return"0001111";
        break;
    //  A_ADD_1
    case 12:
        return "0110111";
        break;
    //M_ADD_1
    case 13:
        return "1110111";
        break;
    //D_ADD_1,
    case 14:
        return "0011111";
        break;
    //  A_SUB_1,
    case 15:
        return "0110010";
        break;
    //    M_SUB_1,
    case 16:
        return "1110010";
        break;
    //    D_SUB_1,
    case 17:
        return "0001110";
        break;
    //    D_ADD_A,
    case 18:
        return "0000010";
        break;
    //    D_ADD_M,
    case 19:
        return "1000010";
        break;
    //    D_SUB_A,
    case 20:
        return "0010011";
        break;
    //    D_SUB_M,
    case 21:
        return "1010011";
        break;
    //    A_SUB_D,
    case 22:
        return "0000111";
        break;
    //    M_SUB_D,
    case 23:
        return "1000111";
        break;
    //    D_AND_A,
    case 24:
        return "0000000";
        break;
    //    D_AND_M,
    case 25:
        return "1000000";
        break;
    //   D_OR_A,
    case 26:
        return "0010101";
        break;
    //    D_OR_M,
    case 27:
        return "1010101";
        break;
    //    NULL_COMP
    default:
        return "";
        break;
    }
}

/**
 * Generates the binary bits for an A-instruction, parsing the value, or looking up the symbol name.
 * @param symbol A string containing either a label name, a variable name, or a constant integer value
 * @param symbolTable The symbol table for looking up label/variable names
 * @return A string containing the 15 binary bits that correspond to the given sybmol.
 */
string Assembler::translateSymbol(string symbol, SymbolTable* symbolTable) {
    if (isNumber(symbol)) {
        return deciToBi(stoi(symbol));
    }
    else {
        return deciToBi(symbolTable->getSymbol(symbol));
    }
}

/*
* receives a decimal unsigned int and convert it to an string that represents a 15 bit binary number
*/
string Assembler::deciToBi(int deciNumber)
{
    string binaryResult = "";
    while (deciNumber!=0) {
        binaryResult = to_string(deciNumber % 2) + binaryResult;
        deciNumber = deciNumber / 2;
    }
    if (binaryResult.length() > 15) {
        size_t start = binaryResult.length() - 15;
        binaryResult = binaryResult.substr(start, 15);
    }
    else if (binaryResult.length() < 15) {
        string zeros(15 - binaryResult.length(), '0');
        binaryResult = zeros + binaryResult;
    }
    return binaryResult;
}

bool Assembler::isNumber(string symbol)
{
    for (auto c:symbol) {
        if (!isdigit(c)) {
            return false;
        }
    }
    return true;
}

string Assembler::trim(string str)
{
    str.erase(0, str.find_first_not_of('\t'));
    str.erase(0, str.find_first_not_of(' '));
    for (auto start = str.begin(); start != str.end(); start++) {
        if ((*start) == ' '||(*start=='\t')) {
            str.erase(start);
            start--;
        }
    }
    return str;
}
