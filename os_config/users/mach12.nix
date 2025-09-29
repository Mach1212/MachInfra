{
  uid,
  extraGroups,
  ...
}: let
  userName = "mach12";
in {
  imports = [
    ({pkgs, ...} @ args:
      import ../modules/cli/zsh.nix (args
        // {
          inherit userName;
        }))
  ];
  users.users.${userName} = {
    inherit uid extraGroups;
    isNormalUser = true;
    description = "Maciej Pruchnik";
    hashedPassword = "$6$ZtQ9AV7qlyLB7IV5$/ZBW5blW7ndJsqycYY2NcVjHLbmXpJsmdTFLQHKRvQHsB9/6W02U0k0/6baVjNOn4QcOUrQwMRgWzFfnggDbr/"; # mkpasswd -m sha-512 myPassword
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpAKr38MocXOkLtWT//RV+WgbIif9azFZIq17+ppl+tpyyXAk+hAJrsHvYT1yMRoXsuxeJUBAv2v66ajxtHQ5YRk6fTg/r1CB1sa0RoKP1e2xZLbdicHKeBnVH6GX+VPVrXkw1wMKsrc0/28yH3LC69m7ImdkDaBMO50LX1ctODOFwD765MUcsbOtVK7EDGr0BUc+Ck7qhozeBMtS2A55u8M4hSUG0My92iRtB4czlKKYPR56tzXxaE7tR9C12Y6Uq8Ok1D5bOAZeL9wIRoVeaLr290upO5clHyCaUkMIFrshkwUQR0E4iV0nACvrzj9Hzm/4sWlpsQkTI5lUcCKMj ssh-key-2023-11-18"];
  };
}
