#!/usr/bin/env python3
"""
Script to run various code examples in the repository
"""

import os
import sys
import subprocess

def run_python_example():
    """Run Python RF spectrum analyzer"""
    print("Running Python RF spectrum analyzer...")
    try:
        subprocess.run([sys.executable, "RF/spectrum_analyzer.py"], check=True)
    except Exception as e:
        print(f"Error running Python example: {e}")

def main():
    print("=" * 50)
    print("Yan Defter - Code Examples Runner")
    print("=" * 50)
    print("\n1. Python RF Spectrum Analyzer")
    print("2. Exit")
    
    choice = input("\nSelect an example to run (1-2): ")
    
    if choice == "1":
        run_python_example()
    elif choice == "2":
        print("Exiting...")
    else:
        print("Invalid choice!")

if __name__ == "__main__":
    main()
