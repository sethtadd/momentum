// helperFunctions.cpp

#include <string>
#include <iostream>

#include "glad/glad.h"
#include "GLFW/glfw3.h"

GLFWwindow* windowInit(int _width, int _height, std::string _name)
{

  glfwInit();
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);

  GLFWwindow* window = glfwCreateWindow(_width, _height, _name.c_str(), nullptr, nullptr);
  if (window == NULL)
  {
    printf("Failed to create GLFW window\n");
    glfwTerminate();
    return nullptr;
  }
  glfwMakeContextCurrent(window);

  return window;
}
