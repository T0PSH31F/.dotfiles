{ lib, config, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.starship;
  fish = config.${namespace}.programs.terminal.shells.fish;
  zsh = config.${namespace}.programs.terminal.shells.zsh;
  bash = config.${namespace}.programs.terminal.shells.bash;
in
{
  options.${namespace}.programs.terminal.tools.starship = {
    enable = mkBoolOpt false "Whether or not to enable starship.";
  };

  config = mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
        enableZshIntegration =  true;
      settings = {
          format = ''$nix_shell$directory$aws$all$package$fill$vcsh$git_commit$git_state$git_metrics$git_branch$git_status
$cmd_duration$jobs$battery$status$shell$custom$memory_usage$character'';
          right_format = "$time";

          add_newline = true;

          time = {
            disabled = false;
            style = "#939594";
            format = "[$time]($style)";
          };

          character = {
            success_symbol = "[⏵](bright-red)[⏵](bright-blue)[⏵](bright-cyan)";
            error_symbol = "[⏵⏵⏵](red)";
            vicmd_symbol = "[⌜](bold purple)";
          };

          cmd_duration = {
            show_notifications = true;
            notification_timeout = 3500;
            min_time_to_notify = 30000;
            format = "[ $duration ]($style)";
          };

          fill.symbol = " ";
          line_break = {
            disabled = true;
          };

          battery = {
            format = "[$symbol $percentage]($style) ";
            full_symbol = " ";
            charging_symbol = " ";
            discharging_symbol = " ";
            unknown_symbol = " ";
            empty_symbol = " ";
          };

          directory = {
            format = "[ $path ]($style)[$read_only]($read_only_style) ";
            style = "fg:#999cb2 bg:#2d2f40 bold";
            read_only = "  ";
            read_only_style = "fg:black bg:red";
            truncation_length = 1;
          };

          memory_usage = {
            disabled = false;
            threshold = 70;
            symbol = "🐏";
            style = "bold dimmed red";
          };

          aws = {
            style = "bold #bb7445";
            symbol = "🌩  ";
            expiration_symbol = "🔒 ";
            format = "· [$symbol($profile )($duration )]($style) ";
          };

          git_branch = {
            style = "#2d2f40 bold";
            symbol = "";
            format = "[ $symbol ](fg:#e84d31 bg:$style)[$branch ](fg:#999cb2 bg:$style)";
          };

          git_status = {
            style = "#2d2f40";
            conflicted = "[ ](bold fg:88 bg:#2d2f40)[  $count ](fg:#999cb2 bg:#2d2f40)";
            staged = "[ $count ](fg:#999cb2 bg:#2d2f40)";
            modified = "[ $count ](fg:#999cb2 bg:#2d2f40)";
            renamed = "[ $count ](fg:#999cb2 bg:#2d2f40)";
            deleted = "[󰗨 $count ](fg:#999cb2 bg:#2d2f40)";
            untracked = "[ $count ](fg:#999cb2 bg:#2d2f40)";
            stashed = "[ $count ](fg:#999cb2 bg:#2d2f40)";
            ahead = "[󰳡 $count ](fg:#523333 bg:#2d2f40)";
            behind = "[󰳛 $count ](fg:#999cb2 bg:#2d2f40)";
            diverged = "[󱓌 ](fg:88 bg:#2d2f40)[ נּ ](fg:#999cb2 bg:#2d2f40)[ $ahead_count ](fg:#999cb2 bg:#2d2f40)[ $behind_count ](fg:#999cb2 bg:#2d2f40)";
            format = "((bg:$style fg:#999cb2)$conflicted$staged$modified$renamed$deleted$untracked$stashed$ahead_behind(fg:$style))";
          };

          git_commit = {
            style = "#2d2f40";
            format = "(bg:$style)[\\($hash$tag\\)](fg:#999cb2 bg:$style)(fg:$style)";
          };

          git_state = {
            style = "#2d2f40";
            format = "(bg:$style)[ \\($state( $progress_current/$progress_total)\\)](fg:#999cb2 bg:$style)(fg:$style)";
          };

          nodejs = {
            format = "· [$symbol($version )]($style) ";
          };

          rust = {
            style = "bold #d2470a";
            format = "· [$symbol($version )]($style) ";
          };

          nix_shell = {
            symbol = "❄";
            impure_msg = "[ ❄⁣ ](fg:white bg:red bold)";
            pure_msg = "[ ❄⁣ ](fg:white bg:blue bold)";
            format = "[$state]($style)";
          };
          package.format = "· [$symbol$version]($style) ";

        };
      };
    };
  };
}
