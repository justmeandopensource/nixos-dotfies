{ config, pkgs, ... }: {

  virtualisation.lxd = {
    enable = true;
    recommendedSysctlSettings = true;
  };

  virtualisation.lxc.lxcfs.enable = true;

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };

  boot.kernelModules = [ "nf_nat_ftp" ];  

}
