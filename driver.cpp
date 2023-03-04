//****************************************************************************************************************************
//Program name: "Pythagoras".  This program takes in the user input of height and width in float and calculates perimeter and
//average side length. Copyright (C) 2023 William Phung.                                                                     *
//                                                                                                                           *
//This file is part of the software program "Pythagoras".                                                                    *
//Pythagoras is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License    *
//version 3 as published by the Free Software Foundation.                                                                    *
//Pythagoras is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied           *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************

//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//  Author name: William Phung
//  Author email: willism1769@csu.fullerton.edu
//
//Program information
//  Program name: William Phung
//  Programming languages: One module in C++ and one module in X86
//  Date program began: 2023 Feb 03
//  Date of last update: 2023 Feb 06
//  Files in this program: driver.cpp, pythagoras.asm, r.sh
//  Status: Finished.
//
//Purpose
// Compute the length of the hypotenuse of a right triangle given the lengths of the two sides.
//
//This file
//   File name: driver.cpp
//   Language: C++
//   Max page width: 132 columns
//   Compile: g++ -c -m64 -Wall -o driver.o driver.cpp
//   Link: g++ -m64 -o pythagoras.out driver.o pythagoras.o
//   Optimal print specification: 132 columns width, 7 points, monospace, 8½x11 paper
//
//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//
//===== Begin code area ===========================================================================================================

#include <iostream>
#include <iomanip>
#include <cstdio>

using namespace std;

extern "C" double pythagoras();

int main()
{

    cout << "Welcome to Pythagoras' Math Lab programmed by William Phung" << endl 
    << "Please contact me at willism1769@csu.fullerton.edu if you need assistance.\n\n";

    double hypot = 0.0;
    hypot = pythagoras();

    cout << "\n\nThe main file received this number: " << setprecision(12) << fixed << hypot << ", and will keep it for now.\n"
    << "We hoped you enjoyed your right angles. Have a good day. A zero will be sent to your operating system.\n\n\n";
    
    return 0;
}