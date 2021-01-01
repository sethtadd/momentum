// App.hpp

#pragma once

#include <string>
#include <iostream>

#include "glad/glad.h"
#include "GLFW/glfw3.h"

class App
{
    public:
        App(int _width, int _height, std::string _name);
        ~App();
        
        void init();
        void loop();

        GLFWwindow* getWindow();
        
    private:
        int width, height;
        std::string name;
        GLFWwindow* window;
};