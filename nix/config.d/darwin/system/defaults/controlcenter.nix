{ ... }:

{
  # TODO(himkt); other items visibility settings (e.g. Wi-Fi).
  # It modifies the almost same entries as the following command:
  # `defaults -currentHost write com.apple.controlcenter WiFi -int 18`
  # (18: show, 24: hide)
  #
  # However, it didn't change macOS UI actually even if I explicitly ran `killall SystemUIServer`.
  # https://superuser.com/questions/398071/how-can-i-hide-show-the-wi-fi-menu-item-from-the-terminal-in-os-x
  #
  # system.defaults.CustomUserPreferences."com.apple.controlcenter" = {
  #   "NSStatusItem Preferred Position WiFi" = 18;
  #   "NSStatusItem Visible WiFi"            = 1;
  # };

  system.defaults.controlcenter = {
    AirDrop                = false;
    BatteryShowPercentage  = false;
    Bluetooth              = false;
    Display                = false;
    FocusModes             = false;
    NowPlaying             = false;
    Sound                  = false;
  };
}
