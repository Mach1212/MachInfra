{
  plugins.notify.settings = {
    timeout = 3000;
    minimum_width = 30;
    max_width = 80;
    max_height = 10;
    # render = "wrapped-compact";
    stages = "fade";
  };
  plugins.conform-nvim.settings = {
    log_level = "warn";
    notify_on_error = true;
    notify_no_formatters = true;
  };
}
