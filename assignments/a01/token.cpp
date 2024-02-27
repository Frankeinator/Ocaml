#include "token.h"
#include <algorithm>

bool Token::isAllDigits(const std::string& str)
{
    return std::all_of(str.begin() + (str.size() > 0 && str[0] == '-' ? 1 : 0), str.end(), [](unsigned char c) { return std::isdigit(c); });
}

void Token::tokenizeThis(std::string input)
{
    std::string temp;
    for (size_t i = 0; i < input.size(); i++)
    {
        if(input[i] != ' ' && input[i] != '\n' && input[i] != '\t')
        {
            temp += input[i];
        } else {
            if(!temp.empty()){
                tokens.push_back(temp);
                temp.clear();
            }
        }
    }
    if(!temp.empty())
        tokens.push_back(temp);

    //Looks for unary '-' '+'
    //Changes from '---------1' to '-1'
    //'+1' to '1', '+-1' to '-1', '--1' to '1', etc...
    determineUnary();

    //Start literalTokens
    for (size_t i = 0; i < tokens.size(); i++)
    {
        if(isAllDigits(tokens[i]))
        {
            literalTokens.push_back("IntToken(" + tokens[i] + ")");
        } 
        else if (tokens[i] == "*")
        {
            literalTokens.push_back("MultToken");
        }
        else if (tokens[i] == "/")
        {
            literalTokens.push_back("DivToken");
        }
        else if (tokens[i] == "-")
        {
            literalTokens.push_back("MinusToken");
        }
        else if (tokens[i] == "+")
        {
            literalTokens.push_back("PlusToken");
        }
        else if (tokens[i] == "%")
        {
            literalTokens.push_back("ModToken");
        }
    }
}

void Token::determineUnary()
{
    for (int i = 0; i < tokens.size(); i++)
    {
        int mCount = 0;
        if (tokens[i] == "+" && tokens[i] == "-") continue;
        std::string x;
        for (char c : tokens[i])
        {
            if (c == '-')
            {
                //std::cout << "skipped '-'\n";
                mCount++;
                continue;
            }
            else if (c != '+')
            {
                x += c;
                //std::cout << "Append: " << c << '\n';
            }
        }
        //std::cout << "First char of tokens[i]: " << tokens[i][0] << '\n' << "'-' count: " << mCount << '\n';
        if(mCount % 2 == 1)
        {
            //std::cout << "INSIDE, SHOULD ADD A '-' BUT IT'S NOT\n";
            x.insert(0, "-");
            //std::cout << x << std::endl;
        }
        //std::cout << "\n----------\n\n";
        tokens[i] = x;
    }    
}
