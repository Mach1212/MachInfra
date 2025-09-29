let
  mach12 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHn1PB8H4XN+9RosozUXI+ECmQF8mzJVbBIp/C+RcS/0";
  work = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP8pBEW1PFTSX4qV7CdaHAxQT5YST6qPwf8b7/fRDB1v";
in {
  # "secret1.age".publicKeys = [ user1 system1 ];
  "mach12pass.age".publicKeys = [mach12];
}
