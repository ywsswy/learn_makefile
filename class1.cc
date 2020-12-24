#include "class1.h"
#include <iostream>

int Class1::NetReq(int a) {
    //net request, please mock me
    return a * 2;
}

void Class1::SayName()
{
    std::cout << NetReq(2) << std::endl;
}

