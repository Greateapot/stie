#ifndef HELLO_H
#define HELLO_H

typedef enum _HelloValue {
    HelloWorld,
    HelloSun,
} HelloValue_t;

void say_hello_to(HelloValue_t hello_value);

#endif