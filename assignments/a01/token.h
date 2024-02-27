#pragma once
#include <iostream>
#include <vector>
#include <string>

class Token
{
  public:
    Token()
    {}

    void tokenizeThis(std::string input);
    
    inline void clearTokens()
    {
      tokens.clear();
      literalTokens.clear();
    }

    void printTokens();

                //priv tokens
    void determineUnary();

    bool isAllDigits(const std::string& str);
    
    std::vector<std::string> getTokens()
    {
      return tokens;
    }

    std::vector<std::string> getLitTokens()
    {
      return literalTokens;
    }

    friend std::ostream& operator<<(std::ostream& cout, Token& tok);

  private:
    std::vector<std::string> tokens;
    std::vector<std::string> literalTokens; //ex: PlusToken() -- idk if ill use this or not
};

inline std::ostream& operator<<(std::ostream& cout, Token& tok)
    {
        cout << '[';
        for(size_t i = 0; i < tok.getTokens().size(); i++)
        {
            cout << tok.getTokens()[i];
            if (i + 1 < tok.getTokens().size())
                cout << ", ";
        }
        cout << ']';
        return cout;
    }
