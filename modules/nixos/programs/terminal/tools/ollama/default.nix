{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.ollama;
in
{
  options.${namespace}.programs.terminal.tools.ollama = with types; {
    enable = mkBoolOpt true "Whether or not to enable ollama.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      aider-chat
      vimPlugins.aider-nvim
      aichat
      alpaca
      code-cursor
      fabric-ai
      gptscript
      gpt4all
      gorilla-cli
      jan
      lexido
      lmstudio
      local-ai
      lunacy
      mistral-rslexido
      mods
      openai-whisper-cpp
      ollama
      openllm
      open-interpreter
      open-webui
      python312Packages.gptcache
      python312Packages.haystack-ai
      python312Packages.langchain
      python312Packages.langsmith
      python312Packages.llama-index
      python312Packages.llama-index-core
      python312Packages.llama-index-llms-ollama
      python312Packages.litellm
      python312Packages.vllm
      pentestgpt
      pinokio
      screen-pipe
      skypilot
      zed-editor
    ];

services.nextjs-ollama-llm-ui.enable = true;

  };
}