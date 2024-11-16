#include "stie.h"

int main()
{
    cup_t *someCup = prepare_cup(CUP_SIZE_SMALL);
    add_water(someCup, 50);
    brew_tea(someCup, TEA_TYPE_PINK);
    add_honey(someCup, 2);
    serve(someCup);
    empty_cup(someCup);
    return 0;
}