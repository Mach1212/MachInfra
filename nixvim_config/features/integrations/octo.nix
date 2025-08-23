{
  plugins.octo = {
    enable = true;
    settings = {
      # mappings_disable_default = true;
      enable_builtin = true;
    };
  };
  keymaps = [
    {
      key = "<leader>go";
      action = ''<CMD>Octo<CR>'';
      options.desc = "Gh";
    }
    {
      key = "<leader>gpl";
      action = ''<CMD>Octo pr list<CR>'';
      options.desc = "GhPrList";
    }
    {
      key = "<leader>gpR";
      action = ''<CMD>Octo pr reload<CR>'';
      options.desc = "GhPrReload";
    }
    {
      key = "<leader>gpc";
      action = ''<CMD>Octo pr commits<CR>'';
      options.desc = "GhPrCommits";
    }
    {
      key = "<leader>gpC";
      action = ''<CMD>Octo pr checkout<CR>'';
      options.desc = "GhPrCheckout";
    }
    {
      key = "<leader>gpf";
      action = ''<CMD>Octo pr changes<CR>'';
      options.desc = "GhPrFiles";
    }
    {
      key = "<leader>gprr";
      action = ''<CMD>Octo review start<CR>'';
      options.desc = "GhPrReview";
    }
    {
      key = "<leader>gprs";
      action = ''<CMD>Octo review submit<CR>'';
      options.desc = "GhPrReviewSubmit";
    }
    {
      key = "<leader>gmc";
      action = ''<CMD>Octo comment add<CR>'';
      options.desc = "GhPrReview";
    }
    {
      key = "<leader>gi";
      action = ''<CMD>lua <CR>'';
      options.desc = "Gh";
    }
  ];
  plugins.which-key.settings.spec = [
    {
      __unkeyed = "<leader>gp";
      group = "GhPr";
    }
    {
      __unkeyed = "<leader>gm";
      group = "GhMisc";
    }
    {
      __unkeyed = "<leader>gi";
      group = "GhIssue";
    }
    {
      __unkeyed = "<leader>ge";
      group = "GhEmoji";
    }
    {
      __unkeyed = "<leader>gpr";
      group = "GhPrReview";
    }
  ];
}
