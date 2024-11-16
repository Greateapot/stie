#ifndef STIE_H
#define STIE_H

#include <stdio.h>
#include <stdlib.h>

typedef enum _cup_size
{
    CUP_SIZE_SMALL,
    CUP_SIZE_MEDIUM,
    CUP_SIZE_LARGE,
} cup_size_t;

typedef enum _tea_type
{
    TEA_TYPE_GREEN,
    TEA_TYPE_BLACK,
    TEA_TYPE_PINK,
} tea_type_t;

typedef struct _cup
{
    cup_size_t size;
    tea_type_t type;

    int water;
    int sugar;
    int honey;
    int milk;
    int lemon;
} cup_t;

cup_t *prepare_cup(cup_size_t size);
int add_water(cup_t *cup, int value);
int brew_tea(cup_t *cup, tea_type_t value);
int add_sugar(cup_t *cup, int value);
int add_honey(cup_t *cup, int value);
int add_milk(cup_t *cup, int value);
int add_lemon(cup_t *cup, int value);
int empty_cup(cup_t *cup);
int serve(cup_t *cup);

#endif