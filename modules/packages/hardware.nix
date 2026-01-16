{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # GPU Monitoring
    nvtopPackages.full
    
    # System Sensors
    light
    lm_sensors
    
    # Hardware Info Tools
    atop
    bandwhich
    caligula
    cpufetch
    cpuid
    cpu-x
    cyme
    smartmontools
    pciutils
    
    # Virtualization
    virt-viewer
    libvirt
  ];
}
