#include "stie.h"

int validate_non_negative(int value)
{
    if (value < 0)
    {
        printf("Error: Negative value %d is not allowed.\n", value);
        return 0;
    }
    return 1;
}

cup_t *prepare_cup(cup_size_t size)
{
    cup_t *cup = (cup_t *)malloc(sizeof(cup_t));

    cup->size = size;
    cup->type = TEA_TYPE_BLACK;
    cup->water = 0;
    cup->sugar = 0;
    cup->honey = 0;
    cup->milk = 0;
    cup->lemon = 0;

    printf("Preparing a %s cup...\n", size == CUP_SIZE_SMALL ? "small" : (size == CUP_SIZE_MEDIUM ? "medium" : "large"));
    return cup;
}

int add_water(cup_t *cup, int amount)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (!validate_non_negative(amount))
        return 5;

    cup->water += amount;
    printf("Adding %d ml of water...\n", amount);
    return 0;
}

int brew_tea(cup_t *cup, tea_type_t type)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before brewing tea, you must add water!\n");
        return 2;
    }

    cup->type = type;
    printf("Brewing %s tea...\n", type == TEA_TYPE_GREEN ? "green" : (type == TEA_TYPE_BLACK ? "black" : "pink"));
    return 0;
}

int add_sugar(cup_t *cup, int amount)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding sugar, you must add water!\n");
        return 2;
    }

    if (!validate_non_negative(amount))
        return 5;

    cup->sugar = amount;
    printf("Adding %d teaspoons of sugar...\n", amount);
    return 0;
}

int add_honey(cup_t *cup, int amount)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding honey, you must add water!\n");
        return 2;
    }

    if (!validate_non_negative(amount))
        return 5;

    cup->honey = amount;
    printf("Adding %d teaspoons of honey...\n", amount);
    return 0;
}

int add_milk(cup_t *cup, int amount)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding milk, you must add water!\n");
        return 2;
    }

    if (!validate_non_negative(amount))
        return 5;

    cup->milk = amount;
    printf("Adding %d ml of milk...\n", amount);
    return 0;
}

int add_lemon(cup_t *cup, int amount)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before adding lemon, you must add water!\n");
        return 2;
    }

    if (!validate_non_negative(amount))
        return 5;

    cup->lemon = amount;
    printf("Adding %d slices of lemon...\n", amount);
    return 0;
}

int empty_cup(cup_t *cup)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    free(cup);
    printf("Cup is empty now.\n");

    return 0;
}

int serve(cup_t *cup)
{
    if (cup == NULL)
    {
        printf("ERROR: Cup is NULL.\n");
        return 1;
    }

    if (cup->water <= 0)
    {
        printf("Before serving, you must add water!\n");
        return 2;
    }

    printf("Serving tea!\n");
    printf("1. Cup size: %s\n", cup->size == CUP_SIZE_SMALL ? "small" : (cup->size == CUP_SIZE_MEDIUM ? "medium" : "large"));
    printf("2. Water: %d ml\n", cup->water);
    printf("3. Tea type: %s\n", cup->type == TEA_TYPE_GREEN ? "green" : (cup->type == TEA_TYPE_BLACK ? "black" : "pink"));
    printf("4. Sugar: %d teaspoons\n", cup->sugar);
    printf("5. Honey: %d teaspoons\n", cup->honey);
    printf("6. Milk: %d ml\n", cup->milk);
    printf("7. Lemon: %d slices\n", cup->lemon);

    return 0;
}
