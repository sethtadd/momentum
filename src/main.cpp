// main.cpp

#include <string>
#include <iostream>

#include "glad/glad.h"
#include "GLFW/glfw3.h"

#include "App.hpp"

int main()
{
    App app(800, 600, "Momentum");

    app.init();
    app.loop();

    return 0;
}