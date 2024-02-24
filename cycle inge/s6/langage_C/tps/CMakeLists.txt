cmake_minimum_required(VERSION 3.28)
project(tps C)

set(CMAKE_C_STANDARD 11)

add_executable(tps main.c
        tp1/automate.c)
