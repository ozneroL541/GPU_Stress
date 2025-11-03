<a href="https://github.com/ozneroL541/GPU_Stress/blob/master/LICENSE"><img src="https://img.shields.io/github/license/ozneroL541/GPU_Stress?color=2b9348" alt="License"/></a>

# GPU_Stress
A program to stress NVIDIA GPU as much as possible using CUDA.

## Index
 - [Description](#description)
 - [Download](#download)
 - [Compilation](#compilation)
 - [Execution](#execution)
 - [Documentation](#documentation)
 - [Author](#author)
 - [License](#license)

## Description
This program is based on the simulation program [Perfect_Numbers](#https://github.com/ozneroL541/Perfect_Numbers.git).

## Download
Download the source code from Github

    git clone https://github.com/ozneroL541/GPU_Stress.git

## Compilation
### Requirements
To compile this program you need a [make](#https://directory.fsf.org/wiki/Make/) utility, a C compiler beetween [Intel oneAPI DPC++/C++ Compiler](#https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/dpc-compiler.html) and [GNU Compiler Collection](#https://gcc.gnu.org/) and [CUDA Toolkit](#https://developer.nvidia.com/cuda-downloads).
> By default the make file will use **ICX** if avaiable, otherwise **GCC** will be used.

To compile run:

    make

## Execution
To execute the program on Posix Operative Systems run:
```
bin/gpu_stress
```
On Windows run:
```
.\bin\gpu_stress.exe
```


## Documentation
To document this software use:

    doxygen docfile

## Author
- Radice Lorenzo @ozneroL541

## License
GPU_Stress is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

GPU_Stress is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with GPU_Stress. If not, see http://www.gnu.org/licenses/.
