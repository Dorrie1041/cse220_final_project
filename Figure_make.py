import os
import json
import argparse
import matplotlib.pyplot as plt
import numpy as np
import csv

# Helper function to read descriptor data from JSON
def read_descriptor_from_json(descriptor_filename):
    try:
        with open(descriptor_filename, 'r') as json_file:
            descriptor_data = json.load(json_file)
        return descriptor_data
    except FileNotFoundError:
        print(f"Error: File '{descriptor_filename}' not found.")
        return None
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON in file '{descriptor_filename}': {e}")
        return None

# Helper function to extract specific stats from the CSV files
def get_stats_from_csv(file_path, stat_name):
    try:
        with open(file_path, 'r') as f:
            reader = csv.reader(f)
            for row in reader:
                if stat_name in row[0]:
                    return int(row[1].strip())
    except Exception as e:
        print(f"Error reading {stat_name} from {file_path}: {e}")
    return 0

# Function to compute branch misprediction ratio and generate plot
def get_branch_misprediction_ratio(descriptor_data, sim_path, output_dir):
    benchmarks_org = descriptor_data["workloads_list"].copy()
    benchmarks = []
    branch_mispred_ratio = {}

    try:
        for config_key in descriptor_data["configurations"].keys():
            ratio_config = []
            avg_ratio_config = 0.0
            cnt_benchmarks = 0
            for benchmark in benchmarks_org:
                benchmark_name = benchmark.split("/")
                exp_path = sim_path + '/' + benchmark + '/' + descriptor_data["experiment"] + '/'

                mispredictions = 0
                executed_branches = 0

                # Read from power.stat.0.csv for branch mispredictions and executed branches
                with open(exp_path + config_key + '/power.stat.0.csv') as f:
                    lines = f.readlines()
                    for line in lines:
                        if 'POWER_BRANCH_MISPREDICT_count' in line:
                            tokens = [x.strip() for x in line.split(',')]
                            mispredictions = int(tokens[1])
                        if 'POWER_BRANCH_OP_count' in line:
                            tokens = [x.strip() for x in line.split(',')]
                            executed_branches = int(tokens[1])

                # Calculate branch misprediction ratio
                ratio = mispredictions / executed_branches if executed_branches > 0 else 0
                avg_ratio_config += ratio

                cnt_benchmarks += 1
                if len(benchmarks_org) > len(benchmarks):
                    benchmarks.append(benchmark_name)

                ratio_config.append(ratio)

            # Append average ratio for this configuration
            num = len(benchmarks)
            ratio_config.append(avg_ratio_config / num)
            branch_mispred_ratio[config_key] = ratio_config

        # Add 'Avg' to the benchmark list
        benchmarks.append('Avg')

        # Plot the Branch Misprediction Ratio data
        plot_data(benchmarks, branch_mispred_ratio, 'Branch Misprediction Ratio', output_dir + '/Branch_Misprediction_Ratio.png')

    except Exception as e:
        print(e)

def get_dcache_miss_ratio(descriptor_data, sim_path, output_dir):
    benchmarks_org = descriptor_data["workloads_list"].copy()
    benchmarks = []
    dcache_miss_ratio = {}

    try:
        for config_key in descriptor_data["configurations"].keys():
            ratio_config = []
            avg_ratio_config = 0.0
            cnt_benchmarks = 0
            for benchmark in benchmarks_org:
                benchmark_name = benchmark.split("/")[-1]
                exp_path = sim_path + '/' + benchmark + '/' + descriptor_data["experiment"] + '/'

                dcache_misses = 0
                dcache_hits = 0

                # Read from memory.stat.0.csv for DCache misses and hits
                with open(exp_path + config_key + '/memory.stat.0.csv') as f:
                    for line in f:
                        if "DCACHE_HIT_count" in line and "DC_PREF_REQ_DCACHE_HIT_count" not in line:
                            print("HIT line: ", line.strip())  # Debug print
                            dcache_hits = int(line.split(',')[1].strip())
                        elif "DCACHE_MISS_count" in line and "NUM_WINDOWS_WITH_DCACHE_MISS_count" not in line:
                            print("MISS line: ", line.strip())  # Debug print
                            dcache_misses = int(line.split(',')[1].strip())

                # Debugging print for the current benchmark
                print(f"Benchmark: {benchmark_name}, DCache Misses: {dcache_misses}, DCache Hits: {dcache_hits}")

                # Calculate DCache miss ratio
                dcache_accesses = dcache_misses + dcache_hits
                if dcache_accesses > 0:
                    ratio = dcache_misses / dcache_accesses
                else:
                    ratio = 0

                avg_ratio_config += ratio
                cnt_benchmarks += 1

                # Append benchmark name if not already done
                if len(benchmarks_org) > len(benchmarks):
                    benchmarks.append(benchmark_name)

                ratio_config.append(ratio)

            # Append average ratio for this configuration
            if cnt_benchmarks > 0:
                ratio_config.append(avg_ratio_config / cnt_benchmarks)
            else:
                ratio_config.append(0)
            dcache_miss_ratio[config_key] = ratio_config

        # Add 'Avg' to the benchmark list
        benchmarks.append('Avg')

        # Plot the DCache Miss Ratio data
        plot_data(benchmarks, dcache_miss_ratio, 'DCache Miss Ratio', output_dir + '/DCache_Miss_Ratio.png')

    except Exception as e:
        print(e)

def get_icache_miss_ratio(descriptor_data, sim_path, output_dir):
    benchmarks_org = descriptor_data["workloads_list"].copy()
    benchmarks = []
    icache_miss_ratio = {}

    try:
        for config_key in descriptor_data["configurations"].keys():
            ratio_config = []
            avg_ratio_config = 0.0
            cnt_benchmarks = 0
            for benchmark in benchmarks_org:
                benchmark_name = benchmark.split("/")
                exp_path = sim_path + '/' + benchmark + '/' + descriptor_data["experiment"] + '/'
                
                icache_misses = 0
                icache_hits = 0
                
                # Read from memory.stat.0.csv for ICache misses and hits
                with open(exp_path + config_key + '/memory.stat.0.csv') as f:
                    lines = f.readlines()
                    for line in lines:
                        if 'ICACHE_MISS_count' in line:
                            tokens = [x.strip() for x in line.split(',')]
                            icache_misses = int(tokens[1])
                        if 'ICACHE_HIT_count' in line:
                            tokens = [x.strip() for x in line.split(',')]
                            icache_hits = int(tokens[1])

                # Calculate ICache miss ratio
                icache_accesses = icache_misses + icache_hits
                ratio = icache_misses / icache_accesses if icache_accesses > 0 else 0
                avg_ratio_config += ratio

                cnt_benchmarks += 1
                if len(benchmarks_org) > len(benchmarks):
                    benchmarks.append(benchmark_name)

                ratio_config.append(ratio)

            # Append average ratio for this configuration
            num = len(benchmarks)
            ratio_config.append(avg_ratio_config / num)
            icache_miss_ratio[config_key] = ratio_config

        # Add 'Avg' to the benchmark list
        benchmarks.append('Avg')

        # Plot the ICache Miss Ratio data
        plot_data(benchmarks, icache_miss_ratio, 'ICache Miss Ratio', output_dir + '/ICache_Miss_Ratio.png')

    except Exception as e:
        print(e)
def get_IPC(descriptor_data, sim_path, output_dir):
  benchmarks_org = descriptor_data["workloads_list"].copy()
  benchmarks = []
  ipc = {}

  try:
    for config_key in descriptor_data["configurations"].keys():
      ipc_config = []
      avg_IPC_config = 0.0
      cnt_benchmarks = 0
      for benchmark in benchmarks_org:
        benchmark_name = benchmark.split("/")
        exp_path = sim_path+'/'+benchmark+'/'+descriptor_data["experiment"]+'/'
        IPC = 0
        with open(exp_path+config_key+'/memory.stat.0.csv') as f:
          lines = f.readlines()
          for line in lines:
            if 'Periodic IPC' in line:
              tokens = [x.strip() for x in line.split(',')]
              IPC = float(tokens[1])
              break

        avg_IPC_config += IPC

        cnt_benchmarks = cnt_benchmarks + 1
        if len(benchmarks_org) > len(benchmarks):
          benchmarks.append(benchmark_name)

        ipc_config.append(IPC)

      num = len(benchmarks)
      print(benchmarks)
      ipc_config.append(avg_IPC_config/num)
      ipc[config_key] = ipc_config

    benchmarks.append('Avg')
    plot_data(benchmarks, ipc, 'IPC', output_dir+'/IPC.png')

  except Exception as e:
    print(e)        

def get_dcache_miss_ratios(descriptor_data, sim_path, output_dir):
    benchmarks_org = descriptor_data["workloads_list"].copy()
    benchmarks = []
    dcache_miss_ratios = {}
    num_configs = len(descriptor_data["configurations"].keys())

    try:
        for config_key in descriptor_data["configurations"].keys():
            compulsory_misses_config = [0] * len(benchmarks_org)
            capacity_misses_config = [0] * len(benchmarks_org)
            conflict_misses_config = [0] * len(benchmarks_org)

            avg_compulsory = 0.0
            avg_capacity = 0.0
            avg_conflict = 0.0
            cnt_benchmarks = 0

            for idx, benchmark in enumerate(benchmarks_org):
                benchmark_name = benchmark.split("/")[-1]
                exp_path = os.path.join(sim_path, benchmark, descriptor_data["experiment"], config_key)

                compulsory_misses = 0
                capacity_misses = 0
                conflict_misses = 0

                try:
                    with open(os.path.join(exp_path, 'memory.stat.0.csv')) as f:
                        for line in f:
                            if "COMPULSORY_MISS" in line:
                                compulsory_misses = int(line.split(',')[1].strip())
                            elif "CAPACITY_MISS" in line:
                                capacity_misses = int(line.split(',')[1].strip())
                            elif "CONFLICT_MISS" in line:
                                conflict_misses = int(line.split(',')[1].strip())
                except FileNotFoundError:
                    print(f"File not found: {os.path.join(exp_path, 'memory.stat.0.csv')}")
                    continue

                total_misses = compulsory_misses + capacity_misses + conflict_misses

                if total_misses > 0:
                    compulsory_ratio = compulsory_misses / total_misses
                    capacity_ratio = capacity_misses / total_misses
                    conflict_ratio = conflict_misses / total_misses
                else:
                    compulsory_ratio = capacity_ratio = conflict_ratio = 0

                avg_compulsory += compulsory_ratio
                avg_capacity += capacity_ratio
                avg_conflict += conflict_ratio
                cnt_benchmarks += 1

                compulsory_misses_config[idx] = compulsory_ratio
                capacity_misses_config[idx] = capacity_ratio
                conflict_misses_config[idx] = conflict_ratio

                if len(benchmarks) < len(benchmarks_org):
                    benchmarks.append(benchmark_name)

            # Calculate average ratios for this configuration
            if cnt_benchmarks > 0:
                compulsory_misses_config.append(avg_compulsory / cnt_benchmarks)
                capacity_misses_config.append(avg_capacity / cnt_benchmarks)
                conflict_misses_config.append(avg_conflict / cnt_benchmarks)
            else:
                compulsory_misses_config.append(0)
                capacity_misses_config.append(0)
                conflict_misses_config.append(0)

            dcache_miss_ratios[config_key] = {
                "compulsory": compulsory_misses_config,
                "capacity": capacity_misses_config,
                "conflict": conflict_misses_config
            }

        benchmarks.append('Avg')

        # Plot the DCache Miss Ratio data
        plot_stacked_bar(benchmarks, dcache_miss_ratios, output_dir + '/DCache_Miss_Ratio_Stacked.png', num_configs)

    except Exception as e:
        print(e)

def plot_stacked_bar(benchmarks, dcache_miss_ratios, output_file, num_configs):
    configs = list(dcache_miss_ratios.keys())

    # Prepare data for plotting
    compulsory_data = []
    capacity_data = []
    conflict_data = []

    # Collect data for each configuration
    for config in configs:
        compulsory_data.extend(dcache_miss_ratios[config]['compulsory'])
        capacity_data.extend(dcache_miss_ratios[config]['capacity'])
        conflict_data.extend(dcache_miss_ratios[config]['conflict'])

    # Debug print: Check lengths before reshaping
    print("Total compulsory data points:", len(compulsory_data))
    print("Total capacity data points:", len(capacity_data))
    print("Total conflict data points:", len(conflict_data))

    # Total number of benchmarks (excluding 'Avg')
    num_benchmarks = len(benchmarks) - 1  # 'Avg' is not part of reshaping

    # Ensure correct number of data points by trimming
    expected_size = num_benchmarks * num_configs
    compulsory_data = compulsory_data[:expected_size]
    capacity_data = capacity_data[:expected_size]
    conflict_data = conflict_data[:expected_size]

    # Reshape data to ensure 7 configurations for each benchmark
    compulsory_data = np.array(compulsory_data).reshape(num_benchmarks, num_configs).flatten()
    capacity_data = np.array(capacity_data).reshape(num_benchmarks, num_configs).flatten()
    conflict_data = np.array(conflict_data).reshape(num_benchmarks, num_configs).flatten()

    # Adjusting bar width and spacing
    bar_width = 1.2 / num_configs  # Make bars wider
    gap = 0.4  # Reduce the gap between applications
    positions = np.arange(num_benchmarks) * gap * num_configs

    # Define color palettes for each 3C miss type per configuration
    colors = {
        'configuration_1': {'compulsory': '#1f77b4', 'capacity': '#ff7f0e', 'conflict': '#2ca02c'},
        'configuration_2': {'compulsory': '#d62728', 'capacity': '#9467bd', 'conflict': '#8c564b'},
        'configuration_3': {'compulsory': '#e377c2', 'capacity': '#7f7f7f', 'conflict': '#bcbd22'},
        'configuration_4': {'compulsory': '#17becf', 'capacity': '#aec7e8', 'conflict': '#ffbb78'},
        'configuration_5': {'compulsory': '#98df8a', 'capacity': '#c5b0d5', 'conflict': '#f7b6d2'},
        'configuration_6': {'compulsory': '#c49c94', 'capacity': '#fdae6b', 'conflict': '#c7c7c7'},
        'configuration_7': {'compulsory': '#dbdb8d', 'capacity': '#9edae5', 'conflict': '#ff9896'}
    }

    # Create the figure
    fig, ax = plt.subplots(figsize=(35, 12))  # Increase figure size

    # Plot each configuration for each benchmark with different colors
    for i in range(num_configs):
        ax.bar(
            positions + i * bar_width, 
            compulsory_data[i::num_configs], 
            bar_width, 
            label=f'{configs[i]} - Compulsory', 
            color=colors[configs[i]]['compulsory'], 
            alpha=0.7
        )
        ax.bar(
            positions + i * bar_width, 
            capacity_data[i::num_configs], 
            bar_width, 
            bottom=compulsory_data[i::num_configs], 
            label=f'{configs[i]} - Capacity', 
            color=colors[configs[i]]['capacity'], 
            alpha=0.7
        )
        ax.bar(
            positions + i * bar_width, 
            conflict_data[i::num_configs], 
            bar_width, 
            bottom=compulsory_data[i::num_configs] + capacity_data[i::num_configs], 
            label=f'{configs[i]} - Conflict', 
            color=colors[configs[i]]['conflict'], 
            alpha=0.7
        )

    # Configure plot
    ax.set_xlabel('Benchmarks', fontsize=16)
    ax.set_ylabel('DCache Miss Ratio', fontsize=16)
    ax.set_title('DCache Miss Ratio Partitioned by Miss Type and Configuration', fontsize=20)
    ax.set_xticks(positions + bar_width * (num_configs - 1) / 2)
    ax.set_xticklabels(benchmarks[:-1], rotation=45, ha='right')  # Exclude 'Avg'
    ax.legend(loc='upper left', bbox_to_anchor=(1, 1), fontsize='medium')

    plt.tight_layout()
    plt.savefig(output_file)
    plt.show()

def plot_data(benchmarks, data, ylabel_name, fig_name, ylim=None):
    import numpy as np
    import matplotlib.pyplot as plt

    colors = ['#800000', '#911eb4', '#4363d8', '#f58231', '#3cb44b', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#e6beff', '#e6194b', '#000075', '#800000', '#9a6324', '#808080', '#ffffff', '#000000']
    ind = np.arange(len(benchmarks)) * 2  # Increase space between applications
    width = 0.25  # Slightly wider bars for less overlap
    fig, ax = plt.subplots(figsize=(16, 8), dpi=80)
    num_keys = len(data.keys())

    idx = 0
    start_id = -int(num_keys / 1.5)  # Adjust this for better spacing between bars within an application
    for key in data.keys():
        hatch = ''
        if idx % 2:
            hatch = '\\\\'
        else:
            hatch = '///'
        ax.bar(ind + (start_id + idx) * width, data[key], width=width, fill=False, hatch=hatch, color=colors[idx], edgecolor=colors[idx], label=key)
        idx += 1

    ax.set_xlabel("Benchmarks")
    ax.set_ylabel(ylabel_name)
    
    # Adjust x-tick positions
    ax.set_xticks(ind)
    
    # Rotate the labels
    ax.set_xticklabels(benchmarks, rotation=45, ha='right', fontsize=10)
    
    ax.grid('x')

    if ylim is not None:
        ax.set_ylim(ylim)
    
    ax.legend(loc="upper left", ncols=2)
    fig.tight_layout()

    # Save the figure
    plt.savefig(fig_name, format="png", bbox_inches="tight")
    plt.close()

# Main function to parse arguments and call the branch misprediction function
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Generate Branch Misprediction Ratio plot')
    parser.add_argument('-o', '--output_dir', required=True, help='Output directory. Usage: -o /path/to/output')
    parser.add_argument('-d', '--descriptor_name', required=True, help='Descriptor JSON file. Usage: -d /path/to/lab1.json')
    parser.add_argument('-s', '--simulation_path', required=True, help='Simulation results directory. Usage: -s /path/to/simulations')

    args = parser.parse_args()

    descriptor_filename = args.descriptor_name
    descriptor_data = read_descriptor_from_json(descriptor_filename)

    if descriptor_data:
        get_branch_misprediction_ratio(descriptor_data, args.simulation_path, args.output_dir)  