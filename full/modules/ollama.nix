{ config, pkgs, ... }:

{
  # Kích hoạt phần cứng đồ họa (OpenGL / Mesa)
  # Đang có ở file hardware.nix rồi
  # hardware.graphics.enable = true;

  # Cấu hình Driver NVIDIA
  hardware.nvidia = {
    modesetting.enable = true;
    
    # GTX 1650 bắt buộc phải dùng driver proprietary (độc quyền), không dùng open-source
    open = false; 
    
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Chỉ định Xserver sử dụng driver NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];

  # Kích hoạt Ollama với tăng tốc phần cứng CUDA
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  # Ngăn không cho Ollama tự bật khi mở máy
  systemd.services.ollama.wantedBy = pkgs.lib.mkForce [ ];

  # Cho phép cài đặt các phần mềm độc quyền (như Driver NVIDIA)
  nixpkgs.config.allowUnfree = true;

  # (Tùy chọn) Thêm ollama vào danh sách system packages nếu bạn muốn gọi lệnh `ollama` từ Terminal
  environment.systemPackages = [
    pkgs.ollama
  ];
}
