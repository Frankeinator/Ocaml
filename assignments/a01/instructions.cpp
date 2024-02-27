#include "instructions.h"
#include <exception>

int Instructions::add(std::vector<std::string> in)
{
    return in[0] + in[2];
}

int Instructions::sub(std::vector<std::string> in)
{
    return in[0] - in[2];
}

int Instructions::mult(std::vector<std::string> in)
{
    return in[0] * in[2];
}

double Instructions::div(std::vector<std::string> in)
{
    double ans = -1;
    try{
        ans = in[0] + in[2];
    } catch(std::exception& e)
    {
        std::runtime_error("Divide by zero...\n");
    }
}

int Instructions::mod(std::vector<std::string> in)
{
    return in[0] % in[2];
}
