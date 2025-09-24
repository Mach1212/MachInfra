git add .
sudo nix run .#nixosConfigurations."$1".config.system.build.tarballBuilder

# wsl --install --from-file \\wsl.localhost\NixOS\home\mach12\projects\MachInfra\os_config\nixos.wsl --location . --name testing
# wsl --unregister testing
# ./build_wsl.sh mach12wsl && wsl.exe --install --from-file '\\wsl.localhost\NixOS\home\mach12\projects\MachInfra\os_config\nixos.wsl' --location 'C:\Users\MaciejPruchnik\WSL\nixos' --name testing; wsl.exe --unregister testing
