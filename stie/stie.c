#include "stie.h"

cup_t *prepare_cup(tea_size_t size)
{
    cup_t *cup = (cup_t *)malloc(sizeof(cup_t));

    cup->size = size;
    cup->type = TEA_TYPE_BLACK;
    cup->water = 0;
    cup->sugar = 0;
    cup->honey = 0;
    cup->milk = 0;
    cup->lemon = 0;

    return cup;
}

int add_water(cup_t *cup, int value)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    if (value <= 0)
    {
        printf("Value must be greater than zero!\n");
        return 2;
    }

    cup->water += value;
    return 0;
}

int brew_tea(cup_t *cup, tea_type_t value)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before brewing tea, you must add water!\n");
        return 2;
    }

    cup->type = value;
    return 0;
}

int add_sugar(cup_t *cup, int value)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding sugar, you must add water!\n");
        return 2;
    }

    cup->sugar = value;
    return 0;
}

int add_honey(cup_t *cup, int value)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding honey, you must add water!\n");
        return 2;
    }

    cup->honey = value;
    return 0;
}

int add_milk(cup_t *cup, int value)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding milk, you must add water!\n");
        return 2;
    }

    cup->milk = value;
    return 0;
}

int add_lemon(cup_t *cup, int value)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding lemon, you must add water!\n");
        return 2;
    }

    cup->lemon = value;
    return 0;
}

int empty_cup(cup_t *cup)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }

    free(cup);

    return 0;
}

int serve(cup_t *cup)
{
    if (cup == 0)
    {
        printf("Cup is nullptr!\n");
        return 1;
    }
    
    if (cup->water <= 0)
    {
        printf("Before serving, you must add water!\n");
        return 2;
    }

    printf("Serving tea:\n");
    // TODO: print tea data

    return 0;
}
