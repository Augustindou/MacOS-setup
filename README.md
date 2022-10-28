# MacOS Setup

This is an attempt at automating my MacOS setup. It's specific to my personal use but feel free to use it if you want.

# Process

1. Install xcode-command-line-tools
    ```
    xcode-select --install
    ```
2. Install homebrew
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
3. Download and unzip project (can also be done manually)
    ```
    cd ~/Desktop
    curl --location https://github.com/Augustindou/MacOS-setup/archive/refs/heads/master.zip --output MacOS_setup.zip
    unzip MacOS_setup.zip
    cd MacOS-setup-master
    ```
4. Change permissions
    ```
    chmod +x setup.zsh
    ```
5. Run program installs & preferences setup
    ```
    ./setup.zsh
    ```