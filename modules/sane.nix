{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.hardware.sane;

  pkg = if cfg.snapshot
    then pkgs.sane-backends-git
    else pkgs.sane-backends;

  backends = [ pkg ] ++ cfg.extraBackends;

  saneConfig = pkgs.mkSaneConfig { paths = backends; };

  saneExtraConfig = pkgs.runCommand "sane-extra-config" {} ''
    cp -Lr '${pkgs.mkSaneConfig { paths = [ pkgs.sane-backends ]; }}'/etc/sane.d $out
    chmod +w $out
    ${concatMapStrings (c: ''
      f="$out/${c.name}.conf"
      [ ! -e "$f" ] || chmod +w "$f"
      cat ${builtins.toFile "" (c.value + "\n")} >>"$f"
      chmod -w "$f"
    '') (mapAttrsToList nameValuePair cfg.extraConfig)}
    chmod -w $out
  '';

in

{
  options = {
    hardware.sane.enableTest = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf (cfg.enable && cfg.enableTest != false) {
    hardware.sane.configDir = saneExtraConfig.outPath;
  };
}

