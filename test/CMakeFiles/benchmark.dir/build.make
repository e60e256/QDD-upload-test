# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/swli0426/Code/QDD

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/swli0426/Code/QDD

# Include any dependencies generated for this target.
include test/CMakeFiles/benchmark.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/benchmark.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/benchmark.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/benchmark.dir/flags.make

test/CMakeFiles/benchmark.dir/main.cpp.o: test/CMakeFiles/benchmark.dir/flags.make
test/CMakeFiles/benchmark.dir/main.cpp.o: test/main.cpp
test/CMakeFiles/benchmark.dir/main.cpp.o: test/CMakeFiles/benchmark.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/swli0426/Code/QDD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/benchmark.dir/main.cpp.o"
	cd /home/swli0426/Code/QDD/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/benchmark.dir/main.cpp.o -MF CMakeFiles/benchmark.dir/main.cpp.o.d -o CMakeFiles/benchmark.dir/main.cpp.o -c /home/swli0426/Code/QDD/test/main.cpp

test/CMakeFiles/benchmark.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/benchmark.dir/main.cpp.i"
	cd /home/swli0426/Code/QDD/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/swli0426/Code/QDD/test/main.cpp > CMakeFiles/benchmark.dir/main.cpp.i

test/CMakeFiles/benchmark.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/benchmark.dir/main.cpp.s"
	cd /home/swli0426/Code/QDD/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/swli0426/Code/QDD/test/main.cpp -o CMakeFiles/benchmark.dir/main.cpp.s

# Object files for target benchmark
benchmark_OBJECTS = \
"CMakeFiles/benchmark.dir/main.cpp.o"

# External object files for target benchmark
benchmark_EXTERNAL_OBJECTS =

test/benchmark: test/CMakeFiles/benchmark.dir/main.cpp.o
test/benchmark: test/CMakeFiles/benchmark.dir/build.make
test/benchmark: src/libengine.a
test/benchmark: src/libalg.a
test/benchmark: src/libtask.a
test/benchmark: src/libengine.a
test/benchmark: /usr/local/lib/libtbb.so.12.9
test/benchmark: /usr/local/lib/libboost_fiber.so.1.81.0
test/benchmark: /usr/local/lib/libboost_filesystem.so.1.81.0
test/benchmark: /usr/local/lib/libboost_atomic.so.1.81.0
test/benchmark: /usr/local/lib/libboost_context.so.1.81.0
test/benchmark: test/CMakeFiles/benchmark.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/swli0426/Code/QDD/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable benchmark"
	cd /home/swli0426/Code/QDD/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/benchmark.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/benchmark.dir/build: test/benchmark
.PHONY : test/CMakeFiles/benchmark.dir/build

test/CMakeFiles/benchmark.dir/clean:
	cd /home/swli0426/Code/QDD/test && $(CMAKE_COMMAND) -P CMakeFiles/benchmark.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/benchmark.dir/clean

test/CMakeFiles/benchmark.dir/depend:
	cd /home/swli0426/Code/QDD && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/swli0426/Code/QDD /home/swli0426/Code/QDD/test /home/swli0426/Code/QDD /home/swli0426/Code/QDD/test /home/swli0426/Code/QDD/test/CMakeFiles/benchmark.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/benchmark.dir/depend

