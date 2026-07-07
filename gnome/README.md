# NixOS - host "truong" - GNOME

## Cấu trúc
```
flake.nix
hosts/truong/
  config.nix          # cài đặt hệ thống chính (locale, boot, nix settings)
  hardware.nix         # PHẢI thay bằng hardware thật
  users.nix            # tài khoản truong
  variables.nix        # biến môi trường
  packages-fonts.nix    # phần mềm + font
modules/
  gnome.nix            # desktop GNOME
home/
  default.nix          # cấu hình riêng user qua home-manager
```

## Trước khi build

1. Thay `hosts/truong/hardware.nix`:
   ```bash
   sudo nixos-generate-config --show-hardware-config > hosts/truong/hardware.nix
   ```
2. Đổi email trong `home/default.nix` (`programs.git.userEmail`).

## Build

```bash
sudo nixos-rebuild switch --flake .#truong
```

Đăng nhập xong, đổi mật khẩu tạm:
```bash
passwd
```

## Cập nhật sau này

```bash
sudo nix flake update
sudo nixos-rebuild switch --flake .#truong
```
