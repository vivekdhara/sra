import concurrent.futures
import subprocess

def download_srr(srr):
    """Function to download a SRR file using prefetch."""
    try:
        subprocess.run(['prefetch', srr], check=True)
        print(f"Successfully downloaded {srr}")
    except subprocess.CalledProcessError as e:
        print(f"Failed to download {srr}: {e}")

# Read accession numbers from file
with open('SRR_Acc_List.txt', 'r') as file:
    srr_files = [line.strip() for line in file]

# Using ThreadPoolExecutor to download files in parallel
with concurrent.futures.ThreadPoolExecutor(max_workers=22) as executor:
    executor.map(download_srr, srr_files)

