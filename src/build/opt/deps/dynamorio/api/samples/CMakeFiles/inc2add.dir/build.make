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
include deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/depend.make

# Include the progress variables for this target.
include deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/progress.make

# Include the compile flags for this target's objects.
include deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/flags.make

deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/inc2add.c.o: deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/flags.make
deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/inc2add.c.o: ../../deps/dynamorio/api/samples/inc2add.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/inc2add.c.o"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -m64 -fno-strict-aliasing -funsigned-char -fno-stack-protector -fvisibility=internal -std=gnu99 -fno-unwind-tables -O3 -g3 -Wall -Werror -Wwrite-strings -Wvla -Wno-unused-but-set-variable -Wno-stringop-truncation -Wno-format-truncation -Wno-stringop-overflow -O2 -fno-stack-protector -o CMakeFiles/inc2add.dir/inc2add.c.o   -c /home/dongruishen/scarab/src/deps/dynamorio/api/samples/inc2add.c

deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/inc2add.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/inc2add.dir/inc2add.c.i"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -m64 -fno-strict-aliasing -funsigned-char -fno-stack-protector -fvisibility=internal -std=gnu99 -fno-unwind-tables -O3 -g3 -Wall -Werror -Wwrite-strings -Wvla -Wno-unused-but-set-variable -Wno-stringop-truncation -Wno-format-truncation -Wno-stringop-overflow -O2 -fno-stack-protector -E /home/dongruishen/scarab/src/deps/dynamorio/api/samples/inc2add.c > CMakeFiles/inc2add.dir/inc2add.c.i

deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/inc2add.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/inc2add.dir/inc2add.c.s"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -m64 -fno-strict-aliasing -funsigned-char -fno-stack-protector -fvisibility=internal -std=gnu99 -fno-unwind-tables -O3 -g3 -Wall -Werror -Wwrite-strings -Wvla -Wno-unused-but-set-variable -Wno-stringop-truncation -Wno-format-truncation -Wno-stringop-overflow -O2 -fno-stack-protector -S /home/dongruishen/scarab/src/deps/dynamorio/api/samples/inc2add.c -o CMakeFiles/inc2add.dir/inc2add.c.s

# Object files for target inc2add
inc2add_OBJECTS = \
"CMakeFiles/inc2add.dir/inc2add.c.o"

# External object files for target inc2add
inc2add_EXTERNAL_OBJECTS =

deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/inc2add.c.o
deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/build.make
deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/ext/lib64/release/libdrreg.so
deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/ext/lib64/release/libdrmgr.so
deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/ext/lib64/release/libdrcontainers.a
deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/lib64/release/libdynamorio.so
deps/dynamorio/api/bin/libinc2add.so: deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dongruishen/scarab/src/build/opt/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../bin/libinc2add.so"
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/inc2add.dir/link.txt --verbose=$(VERBOSE)
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples && /usr/bin/cmake -E echo "Usage: pass to drconfig or drrun: -c /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples/../bin/libinc2add.so"

# Rule to build all files generated by this target.
deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/build: deps/dynamorio/api/bin/libinc2add.so

.PHONY : deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/build

deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/clean:
	cd /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples && $(CMAKE_COMMAND) -P CMakeFiles/inc2add.dir/cmake_clean.cmake
.PHONY : deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/clean

deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/depend:
	cd /home/dongruishen/scarab/src/build/opt && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dongruishen/scarab/src /home/dongruishen/scarab/src/deps/dynamorio/api/samples /home/dongruishen/scarab/src/build/opt /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples /home/dongruishen/scarab/src/build/opt/deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : deps/dynamorio/api/samples/CMakeFiles/inc2add.dir/depend

