{ config, lib, pkgs, ... }:

{
 systemd.user.services.copy-pyprland-config = {
    description = "Create Pyprland configuration";
    wantedBy = [ "default.target" ];
    script = ''
      cat <<EOF > /home/dwilliams/.config/hypr/pyprland.toml

            [pyprland]
            plugins = [
              "scratchpads",
            ]

            [scratchpads.term]
            animation = "fromTop"
            command = "kitty --class kitty-dropterm"
            class = "kitty-dropterm"
            size = "75% 60%"
            max_size = "1920px 100%"

            [scratchpads.volume]
            animation = "fromRight"
            command = "pavucontrol"
            class = "pavucontrol"
            lazy = true
            size = "40% 90%"

            [scratchpads.thunar]
            animation = "fromBottom"
            command = "thunar"
            class = "thunar"
            size = "75% 60%"

EOF
                '';
  };


}
