#include <iostream>
#include <string>
#include <unordered_map>
#include <limits>
#include <vector>
#include <cstdlib>
#include "token.h"
//#include "instructions.h"

bool running = true;
std::unordered_map < std::string, int > var;

void getInput(std::string& input);
void output(Token tiktoks);
int calculate(Token tiktoks);
int convertToInt(std::string x);

int main()
{
    std::cout << "Type exit() to close\n\n";
    
    Token tiktoks;
    std::string input;
    while(running)
    {
        getInput(input);  

        tiktoks.tokenizeThis(input);
        
        
        
        output(tiktoks);
        
        
        //reset for next iteration
        tiktoks.clearTokens();
    }

    std::cout << "Exiting...\n";
    return 0;
}

void output(Token tiktoks)
{
    //Need to add looking for Unary '-', Unary '+' wont ever be there, its taken out in
    //Token.tokenizeThis() when it checks
    if(tiktoks.getTokens().size() == 1 && tiktoks.isAllDigits(tiktoks.getTokens()[0]))
    {
        if(tiktoks.getTokens()[0][0] == '0' && tiktoks.getTokens()[0][1] != '\0')
        {
            std::cout << "ERROR: I don't understand octals yet\n";
        }
        else
            std::cout << tiktoks.getTokens()[0] << std::endl;
    }
    else if (tiktoks.getTokens().size() > 1 && !tiktoks.isAllDigits(tiktoks.getTokens()[0]))
    {
        std::cout << "Variable: " << tiktoks.getTokens()[0];
        var.insert(tiktoks.getTokens()[0], tiktoks.getTokens()[2]);
        for (auto& x : var)
            std::cout << x.first << " " << x.second << '\n';

    }
    else if (tiktoks.getTokens().size() > 1 && tiktoks.isAllDigits(tiktoks.getTokens()[0]))
    {
        //calculate(tiktoks);
        std::cout << tiktoks << '\n';
    }
    else
    {
        std::cout << "ERROR: \""+ tiktoks.getTokens()[0] +"\" is neither a value nor found in the symtable\n";
    }

    //
}

int calculate(Token tiktoks)
{
    int a;
    for (int i = 0; i < tiktoks.getTokens().size(); i++)
    {
        if (tiktoks.getTokens()[i] != "+" && tiktoks.getTokens()[i] != "-" && tiktoks.getTokens()[i] != "%"
         && tiktoks.getTokens()[i] != "*" && tiktoks.getTokens()[i] != "/")
            a = convertToInt(tiktoks.getTokens()[i]);
        
        std::cout << a << '\n';
    }
    return -1;
}

int convertToInt(std::string x)
{
    std::string temp;
    int n;
    try{
        for (char c : x)
        {
            if(c != '-')
                temp += c;
        }
        n = std::stoi(temp);
        if(x[0] == '-')
        {
            n *= -1;
        }
        std::cout << n;
        return n;
    }
    catch (const std::invalid_argument& e)
    {
        std::cerr << "Invalid argument: " << e.what() << std::endl;
        return 0;
    }
    catch (const std::out_of_range& e)
    {
        std::cerr << "Out of range: " << e.what() << std::endl;
        return 0;
    }
}

void getInput(std::string& input)
{
    std::cout << ">>> ";
    std::getline(std::cin, input);
    if(input == "exit()") exit(EXIT_SUCCESS);
    if (std::cin.eof()) exit(EXIT_FAILURE);
    if(std::cin.fail() || std::cin.bad())
    {
        std::cin.clear();
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    }
}