/* **********************************************************
 * Copyright (c) 2016-2023 Google, Inc.  All rights reserved.
 * **********************************************************/

/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of Google, Inc. nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL VMWARE, INC. OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

/* Standalone opcode_mix analysis tool launcher for file traces. */

#ifdef WINDOWS
#    define UNICODE
#    define _UNICODE
#    define WIN32_LEAN_AND_MEAN
#    include <windows.h>
#endif

#include "droption.h"
#include "dr_frontend.h"
#include "analyzer.h"
#include "opcode_mix_create.h"
#include "../tests/test_helpers.h"

using ::dynamorio::drmemtrace::analysis_tool_t;
using ::dynamorio::drmemtrace::analyzer_t;
using ::dynamorio::drmemtrace::opcode_mix_tool_create;
using ::dynamorio::droption::droption_parser_t;
using ::dynamorio::droption::DROPTION_SCOPE_ALL;
using ::dynamorio::droption::DROPTION_SCOPE_FRONTEND;
using ::dynamorio::droption::droption_t;

namespace {

#define FATAL_ERROR(msg, ...)                               \
    do {                                                    \
        fprintf(stderr, "ERROR: " msg "\n", ##__VA_ARGS__); \
        fflush(stderr);                                     \
        exit(1);                                            \
    } while (0)

static droption_t<std::string>
    op_trace(DROPTION_SCOPE_FRONTEND, "trace", "", "[Required] Trace input directory",
             "Specifies the directory containing the trace files to be analyzed.");

static droption_t<std::string> op_module_file(
    DROPTION_SCOPE_FRONTEND, "module_file", "", "Path to modules.log for legacy traces",
    "For legacy traces that do not contain embedded instruction encodings, "
    "the opcode_mix tool needs the modules.log file (generated by the offline "
    "post-processing step in the raw/ subdirectory) in addition to the trace file. "
    "If the file is named modules.log and is in the same directory as the trace file, "
    "or a raw/ subdirectory below the trace file, this parameter can be omitted.");

static droption_t<std::string> op_alt_module_dir(
    DROPTION_SCOPE_FRONTEND, "alt_module_dir", "", "Alternate module search directory",
    "For legacy traces that do not contain embedded instruction encodings, "
    "specifies a directory containing libraries referenced in -module_file.  "
    "This directory takes precedence over the recorded path.");

droption_t<unsigned int> op_verbose(DROPTION_SCOPE_ALL, "verbose", 0, 0, 64,
                                    "Verbosity level",
                                    "Verbosity level for notifications.");

} // namespace

int
_tmain(int argc, const TCHAR *targv[])
{
    // Convert to UTF-8 if necessary
    char **argv;
    drfront_status_t sc = drfront_convert_args(targv, &argv, argc);
    if (sc != DRFRONT_SUCCESS)
        FATAL_ERROR("Failed to process args: %d", sc);

    std::string parse_err;
    if (!droption_parser_t::parse_argv(DROPTION_SCOPE_FRONTEND, argc, (const char **)argv,
                                       &parse_err, NULL) ||
        op_trace.get_value().empty()) {
        FATAL_ERROR("Usage error: %s\nUsage:\n%s", parse_err.c_str(),
                    droption_parser_t::usage_short(DROPTION_SCOPE_ALL).c_str());
    }

    analysis_tool_t *tool1 =
        opcode_mix_tool_create(op_module_file.get_value(), op_verbose.get_value(),
                               op_alt_module_dir.get_value());
    std::vector<analysis_tool_t *> tools;
    tools.push_back(tool1);
    analyzer_t analyzer(op_trace.get_value(), &tools[0], (int)tools.size());
    if (!analyzer) {
        FATAL_ERROR("failed to initialize analyzer: %s",
                    analyzer.get_error_string().c_str());
    }
    if (!analyzer.run()) {
        FATAL_ERROR("failed to run analyzer: %s", analyzer.get_error_string().c_str());
    }
    analyzer.print_stats();
    delete tool1;

    return 0;
}