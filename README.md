# PyTS 0.1

## Contains
- Compatibility
- How to install
- - On Windows
- - On Linux distros
- - On Macs (***soon***)
- How to report a bug
- Release notes


## Compatibility
PyTS can be installed on all sorts of PCs with an OS compatible with Python (**Windows**, **Linux GUI**, **macOS**).


## How to install
### On Windows
1. Install Python 3.10 or later
2. Install the requirements: `pip install -r requirements.txt`
3. Run PyTS: `python main.py`

### On Linux distros
1. Open the terminal
2. Check if Python is already installed: `python3 -v` - If it's installed, go to step 4
3. If Python isn't installed: `sudo apt update && sudo apt install python3` or (for Fedora) `sudo dnf update && sudo dnf install python3`
4. Install the PyTS requirements: `pip install -r requirements.txt`
5. Run PyTS: `python3 main.py`

### On Macs
***coming soon***


## How to report a bug
1. Go to the Issues section of the GitHub repository
2. Create an issue
**devs only**
3. Create a fork of the repository
4. Fix the issue
5. Submit a pull request


## Release Notes
### v0.1
- Added all apps (some are not functioning)
- Added the menu
- Fixed multiple critical bugs (NameError, recursion, injection issues)
- Added proper error handling and timeouts
- Fixed compatibility issues across Windows, Linux, and macOS