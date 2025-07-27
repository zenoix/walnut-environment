{
  programs.nixvim.userCommands = {
    Notifications = {
      desc = "Show notifications using snacks picker";
      command = "lua Snacks.picker.notifications()";
      count = false;
    };
  };
}
