{
  autoCmd = [
    {
      callback.__raw =
        #lua
        ''
          function(params)
          	vim.notify("Writing " .. tostring(params.file), "info")
          end
        '';
      event = [
        "BufWritePost"
      ];
    }
  ];
}
