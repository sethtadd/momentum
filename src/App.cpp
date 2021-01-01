// App.cpp

#include <string>

#include "App.hpp"

App::App(int _width, int _height, std::string _name)
{
    width  = _width;
    height = _height;
    name   = _name;
}

App::~App()
{
    glfwTerminate();
    printf("GLFW terminated\n");
}

void App::init()
{
    //
    // GLFW initialization
    //
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE); // needed for OSX

    window = glfwCreateWindow(width, height, name.c_str(), nullptr, nullptr);
    if (window == nullptr)
    {
        printf("Failed to create GLFW window\n");
        glfwTerminate();
    }
    glfwMakeContextCurrent(window);

    //
    // GLAD initialization
    //
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
      printf("Failed to initialize GLAD\n");
    }

    //
    // ----------
    //
    glViewport(0, 0, 800, 600);
}

void App::loop()
{
    while( !glfwWindowShouldClose(window) )
    {
      glfwSwapBuffers(window);
      glfwPollEvents();    
    }
}

GLFWwindow* App::getWindow()
{
    return window;
}