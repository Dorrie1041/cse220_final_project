# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dongruishen/scarab/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dongruishen/scarab/src/build/opt

# Include any dependencies generated for this target.
include deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/depend.make

# Include the progress variables for this target.
include deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/progress.make

# Include the compile flags for this target's objects.
include deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/flags.make

deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.o: deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/flags.make
deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.o: ../../deps/dynamorio/clients/drcachesim/tests/test_helpers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.o"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.o -c /home/dongruishen/scarab/src/deps/dynamorio/clients/drcachesim/tests/test_helpers.cpp

deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.i"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dongruishen/scarab/src/deps/dynamorio/clients/drcachesim/tests/test_helpers.cpp > CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.i

deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.s"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dongruishen/scarab/src/deps/dynamorio/clients/drcachesim/tests/test_helpers.cpp -o CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.s

# Object files for target test_helpers
test_helpers_OBJECTS = \
"CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.o"

# External object files for target test_helpers
test_helpers_EXTERNAL_OBJECTS =

deps/dynamorio/clients/lib64/release/libtest_helpers.a: deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/tests/test_helpers.cpp.o
deps/dynamorio/clients/lib64/release/libtest_helpers.a: deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/build.make
deps/dynamorio/clients/lib64/release/libtest_helpers.a: deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../lib64/release/libtest_helpers.a"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim && $(CMAKE_COMMAND) -P CMakeFiles/test_helpers.dir/cmake_clean_target.cmake
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_helpers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/build: deps/dynamorio/clients/lib64/release/libtest_helpers.a

.PHONY : deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/build

deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/clean:
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim && $(CMAKE_COMMAND) -P CMakeFiles/test_helpers.dir/cmake_clean.cmake
.PHONY : deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/clean

deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/depend:
	cd /home/dongruishen/scarab/src/build/opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dongruishen/scarab/src /home/dongruishen/scarab/src/deps/dynamorio/clients/drcachesim /home/dongruishen/scarab/src/build/opt /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/dynamorio/clients/drcachesim/CMakeFiles/test_helpers.dir/depend

