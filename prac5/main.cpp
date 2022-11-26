#include <fstream>
#include <iostream>
#include <regex>
#include <sstream>
#include <string>
#include <vector>

#include "Assembler.h"
#include "SymbolTable.h"

using namespace std;
/**
 * A quick-and-dirty driver.
 * When testing your code, we encourage you to also write code to cheeck individual functions
 * as the autograder will do
 */
const int MAXIMUM = 32768;


int main(int argc, char** argv) {
    if (argc > 1) {
        SymbolTable symbolTable;
        Assembler assembler;
        vector<string> instructionList;

        // Open file
        fstream file;
        string fname = argv[1];
        if ((!file) )
        {
            std::cerr << "Cannot open the file." << std::endl;
            return -1;
        }

        file.open(argv[1], ios::in);
        int fileSize = 0;
        if (file.is_open()) {
            // Read line-by-line
            string line;
            while (getline(file, line)) {
                //remove comments 
                line = assembler.trim(line);
                string::size_type idx = line.find("//");  // find start of "//"
                string lineRmComm = line.substr(0, idx);
                if (lineRmComm.size() == 0) continue;  // skip empty line
                // remove spaces 
                string::iterator str_iter = remove(lineRmComm.begin(), lineRmComm.end(), ' ');
                lineRmComm.erase(str_iter, lineRmComm.end());
                instructionList.push_back(lineRmComm);
                fileSize++;
            }
            file.close();
        }
        // Get array of instructions
        string instructions[MAXIMUM];
        copy(instructionList.begin(), instructionList.end(), instructions);
        //for (int i = 0; i < fileSize; i++) {
       //     cout << instructions[i] << endl;
       // }
       
        
        // First pass
        assembler.doFirstPass(&symbolTable, instructions, fileSize);
        // Second pass
        string code = assembler.doSecondPass(&symbolTable, instructions, fileSize);
        // Print output
        cout << code << endl;
        
    }
}



/*

int main() {    
    Assembler assembler;
    SymbolTable* symbolTable=new SymbolTable();
    string instruction[1] = { "D=D-1" };
    assembler.doFirstPass(symbolTable, instruction, 1);

    cout << instruction[0] << endl;
    cout << assembler.doSecondPass(symbolTable, instruction, 1) << endl;
   
}
*/



