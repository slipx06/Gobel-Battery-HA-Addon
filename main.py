#!/usr/bin/env python3
"""
Gobel Battery Monitor - Standalone Entry Point
"""
import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from sensor import run, check_dependencies, parse_arguments

def main():
    """Main entry point for the standalone application"""
    # Parse command line arguments
    args = parse_arguments()
    
    # Check dependencies
    if not check_dependencies():
        sys.exit(1)
    
    # Run the application
    run(config_file=args.config, debug_mode=args.debug)

if __name__ == "__main__":
    main() 