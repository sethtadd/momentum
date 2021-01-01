// main.cpp

#include <string>
#include <iostream>

#include "glad/glad.h"
#include "GLFW/glfw3.h"

#include "helperFunctions.hpp"

int main()
{

  GLFWwindow* window = windowInit(800, 600, "Momentum");
  if (window == nullptr) printf("Failed to initialize window");

  if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
  {
    printf("Failed to initialize GLAD\n");
    return -1;
  }

  glViewport(0, 0, 800, 600);

  while(!glfwWindowShouldClose(window))
  {
    glfwSwapBuffers(window);
    glfwPollEvents();    
  }

  glfwTerminate();

  printf("GLFW terminated\n");

  return 0;
}
