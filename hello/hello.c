#include <stdio.h>

#include "hello.h"

void say_hello_to(HelloValue_t helloValue) {
    switch (helloValue)
    {
    case HelloSun:
        printf("Hello, sun!\n");
        break;
    
    case HelloWorld:
        printf("Hello, world!\n");
        break;
    }
}
