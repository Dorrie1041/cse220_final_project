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
include deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/depend.make

# Include the progress variables for this target.
include deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/progress.make

# Include the compile flags for this target's objects.
include deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/flags.make

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/optionlist.cpp.o: deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/flags.make
deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/optionlist.cpp.o: ../../deps/dynamorio/clients/drcpusim/optionlist.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/optionlist.cpp.o"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/drcpusim_ops.dir/optionlist.cpp.o -c /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim/optionlist.cpp

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/optionlist.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/drcpusim_ops.dir/optionlist.cpp.i"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim/optionlist.cpp > CMakeFiles/drcpusim_ops.dir/optionlist.cpp.i

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/optionlist.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/drcpusim_ops.dir/optionlist.cpp.s"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim/optionlist.cpp -o CMakeFiles/drcpusim_ops.dir/optionlist.cpp.s

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/options.cpp.o: deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/flags.make
deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/options.cpp.o: ../../deps/dynamorio/clients/drcpusim/options.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/options.cpp.o"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -m64 -fno-strict-aliasing -funsigned-char -fno-stack-protector -fvisibility=internal -std=c++11 -Wsuggest-override -O3 -g3 -Wall -Werror -Wwrite-strings -Wvla -Wno-unused-but-set-variable -Wno-stringop-truncation -Wno-format-truncation -Wno-stringop-overflow -fno-stack-protector -o CMakeFiles/drcpusim_ops.dir/options.cpp.o -c /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim/options.cpp

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/options.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/drcpusim_ops.dir/options.cpp.i"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -m64 -fno-strict-aliasing -funsigned-char -fno-stack-protector -fvisibility=internal -std=c++11 -Wsuggest-override -O3 -g3 -Wall -Werror -Wwrite-strings -Wvla -Wno-unused-but-set-variable -Wno-stringop-truncation -Wno-format-truncation -Wno-stringop-overflow -fno-stack-protector -E /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim/options.cpp > CMakeFiles/drcpusim_ops.dir/options.cpp.i

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/options.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/drcpusim_ops.dir/options.cpp.s"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -m64 -fno-strict-aliasing -funsigned-char -fno-stack-protector -fvisibility=internal -std=c++11 -Wsuggest-override -O3 -g3 -Wall -Werror -Wwrite-strings -Wvla -Wno-unused-but-set-variable -Wno-stringop-truncation -Wno-format-truncation -Wno-stringop-overflow -fno-stack-protector -S /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim/options.cpp -o CMakeFiles/drcpusim_ops.dir/options.cpp.s

# Object files for target drcpusim_ops
drcpusim_ops_OBJECTS = \
"CMakeFiles/drcpusim_ops.dir/optionlist.cpp.o" \
"CMakeFiles/drcpusim_ops.dir/options.cpp.o"

# External object files for target drcpusim_ops
drcpusim_ops_EXTERNAL_OBJECTS =

deps/dynamorio/clients/bin64/drcpusim_ops: deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/optionlist.cpp.o
deps/dynamorio/clients/bin64/drcpusim_ops: deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/options.cpp.o
deps/dynamorio/clients/bin64/drcpusim_ops: deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/build.make
deps/dynamorio/clients/bin64/drcpusim_ops: deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../bin64/drcpusim_ops"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/drcpusim_ops.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/build: deps/dynamorio/clients/bin64/drcpusim_ops

.PHONY : deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/build

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/clean:
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim && $(CMAKE_COMMAND) -P CMakeFiles/drcpusim_ops.dir/cmake_clean.cmake
.PHONY : deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/clean

deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/depend:
	cd /home/dongruishen/scarab/src/build/opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dongruishen/scarab/src /home/dongruishen/scarab/src/deps/dynamorio/clients/drcpusim /home/dongruishen/scarab/src/build/opt /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim /home/dongruishen/scarab/src/build/opt/deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/dynamorio/clients/drcpusim/CMakeFiles/drcpusim_ops.dir/depend

