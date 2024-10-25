{
  programs.foot = {
    enable = true;
    settings = {
      main = let
        withSize = "size=14";
        font = "FiraCode Nerd Font Mono";
      in {
        font = "${font}:${withSize}";
        font-bold = "${font}:style=Bold:${withSize}";
        font-italic = "${font}:style=Italic:${withSize}";
        font-bold-italic = "${font}:style=BoldItalic:${withSize}";
        box-drawings-uses-font-glyphs = true;
        pad="12x12";
      };


      scrollback = {
        lines = 10000;
      };

      url = {
        launch = "xdg-open \${url}";
        protocols = "http, https, ftp, ftps, file";
      };

      colors = {
        alpha = 0.7;
        foreground="cdd6f4";
        background = "000000";
        regular0="45475a";
        regular1="f38ba8";
        regular2="a6e3a1";
        regular3="f9e2af";
        regular4="89b4fa";
        regular5="f5c2e7";
        regular6="94e2d5";
        regular7="bac2de";
        bright0="585b70";
        bright1="f38ba8";
        bright2="a6e3a1";
        bright3="f9e2af";
        bright4="89b4fa";
        bright5="f5c2e7";
        bright6="94e2d5";
        bright7="a6adc8";
      };
    };
  };
}
