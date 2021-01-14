#include <iomanip>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

enum Instruction {
    // Instructions nullaires.
    HALT,  ADD,   DOT,   MPY,   SUB,   UNLK ,  CMP, UNARY,
    // Instructions unaires
    CALL,  EXIT,  INT,   JMP,   JZR,   LINK,  LOAD, STORE,
    MAX_INSTRUCTIONS
};

string mnemonics[MAX_INSTRUCTIONS] = {
        "HALT",  "ADD",    "DOT",    "MPY",   "SUB",   "UNLK", "CMP", "UNARY",
        "CALL",  "EXIT",   "INT",    "JMP",   "JZR",   "LINK",   "LOAD",   "STORE"
};

short code[1024];                       // Mémoire pour le code.
short ip = 0;                           // Instruction Pointer.
short stack[1024];                      // Mémoire pour la pile.
short sp = 0;                           // Stack Pointer.
short fp = 0;                           // Frame Pointer.

void assemble(string line)
{
    // Recherche du mnemonique qui correspond à l'instruction.
    short opcode = 0;

    while (opcode < MAX_INSTRUCTIONS && line.compare(0,3,mnemonics[opcode].substr(0,3)))
        opcode++;

    if (opcode == MAX_INSTRUCTIONS)
        cout << "Error : Unrecognized instruction : " << line << '\n';
    else {
        code[ip++] = opcode;

        // Conversion et stockage du paramètre des instructions unaires.
        if (opcode > UNARY)
        {
            auto offset = mnemonics[opcode].length()+1;
            if (line[offset] == '(')
                offset++;
            code[ip++] = stoi(line.substr(offset, line.length()));
        }
    }
}

void run(bool trace)
{
    bool io = false;    // IO indicator.

    ip = 0;     // Instruction Pointer.
    fp = 0;     // Frame Pointer.
    sp = 0;     // Stack Pointer.

    short accumulator = 0;  // Operations accumulator.

    while (code[ip] != HALT) {

        if (trace) {
            short op = code[ip];
            cout << '[' << setw(4) << ip << "] " << setw(6) << left << mnemonics[op] << setw(4) << right;
            if (op > UNARY)
                cout << code[ip+1];
            else
                cout << ' ';
        }

        switch (code[ip++]) {

            case DOT:
            {
                accumulator = stack[--sp];
                io = true;
                break;
            }

            case INT:
            {
                stack[sp++] = code[ip++];
                break;
            }

            case JZR:
            {
                if (stack[--sp] == 0) // Modifie l'IP si le sommet de la pile est nul
                {
                    ip += code[ip];
                }

                ip++;
                break;

            }

            case JMP:
            {
                ip += code[ip] + 1;
                break;

            }

            case MPY:
            {
                accumulator = stack[--sp]; // Prend les opérandes sur la pile, empile le résultat
                accumulator *= stack[--sp];
                stack[sp++] = accumulator;
                break;
            }

            case ADD:
            {
                accumulator = stack[--sp]; // Prend les opérandes sur la pile, empile le résultat
                accumulator += stack[--sp];
                stack[sp++] = accumulator;
                break;
            }

            case SUB:
            {
                accumulator = -stack[--sp]; // Prend les opérandes sur la pile, empile le résultat
                accumulator += stack[--sp];
                stack[sp++] = accumulator;
                break;
            }

            case CMP:
            {
                accumulator = stack[--sp]; // Prend les opérandes sur la pile, empile le résultat
                accumulator = stack[--sp] < accumulator ? 1 : 0;
                stack[sp++] = accumulator;
                break;
            }

            case UNLK:
            {
                sp = fp + 1;
                fp = stack[--sp];
                break;
            }

            case LINK:
            {
                stack[sp++] = fp;
                fp = sp - 1;
                sp += code[ip++];
                break;
            }

            case CALL:
            {
                stack[sp++] = ip + 1;
                ip = code[ip];
                break;
            }

            case EXIT:
            {
                int temp = ip;
                ip = stack[--sp];
                sp -= code[temp];
            }
                break;

            case LOAD:
            {
                stack[sp++] = stack[fp + code[ip++]];
                break;
            }

            case STORE:
            {
                stack[fp + code[ip++]] = stack[--sp];
                break;
            }

            default:
                cout << "Error : Unrecognized opcode : " << code[ip-1] << '\n';
        }

        if (trace) {

            cout << "   SP" << setw(3) << sp << " : ";

            for (short p = 0; p<sp; p++)
                cout << setw(4) << stack[p];

            cout << '\n';
        }

        if (io) {
            cout << accumulator << '\n';
            io = false;
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc == 2) {

        string line;
        ifstream file;
        file.open(argv[1]);

        if (file.fail())
            cout << "Error : File not found...\n";
        else {
            while (getline(file, line))
                assemble(line);

            run(true);
        }
    }
    else
        std::cout << "Error : Missing file name...\n";

    return 0;
}