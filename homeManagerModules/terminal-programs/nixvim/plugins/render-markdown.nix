{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.render-markdown = {
      enable = true;
      settings = {
        footnote = {
          enabled = true;
          superscript = true;
          prefix = "";
          suffix = "";
        };
        email = "󰀓 ";
        hyperlink = "󰌹 ";
        highlight = "RenderMarkdownLink";
        wiki = {
          icon = "󱗖 ";
          body = {
            __raw = ''
              function()
                return nil
              end
            '';
          };
          highlight = "RenderMarkdownWikiLink";
        };
        custom = {
          web = {
            pattern = "^http";
            icon = "󰖟 ";
          };
          github = {
            pattern = "github%.com";
            icon = "󰊤 ";
          };
          gitlab = {
            pattern = "gitlab%.com";
            icon = "󰮠 ";
          };
          stackoverflow = {
            pattern = "stackoverflow%.com";
            icon = "󰓌 ";
          };
          wikipedia = {
            pattern = "wikipedia%.org";
            icon = "󰖬 ";
          };
          youtube = {
            pattern = "youtube%.com";
            icon = "󰗃 ";
          };
        };
        callout = {

          note = {
            raw = "[!NOTE]";
            rendered = "󰋽 Note";
            highlight = "RenderMarkdownInfo";
          };
          tip = {
            raw = "[!TIP]";
            rendered = "󰌶 Tip";
            highlight = "RenderMarkdownSuccess";
          };
          important = {
            raw = "[!IMPORTANT]";
            rendered = "󰅾 Important";
            highlight = "RenderMarkdownHint";
          };
          warning = {
            raw = "[!WARNING]";
            rendered = "󰀪 Warning";
            highlight = "RenderMarkdownWarn";
          };
          caution = {
            raw = "[!CAUTION]";
            rendered = "󰳦 Caution";
            highlight = "RenderMarkdownError";
          };
          abstract = {
            raw = "[!ABSTRACT]";
            rendered = "󰨸 Abstract";
            highlight = "RenderMarkdownInfo";
          };
          summary = {
            raw = "[!SUMMARY]";
            rendered = "󰨸 Summary";
            highlight = "RenderMarkdownInfo";
          };
          tldr = {
            raw = "[!TLDR]";
            rendered = "󰨸 Tldr";
            highlight = "RenderMarkdownInfo";
          };
          info = {
            raw = "[!INFO]";
            rendered = "󰋽 Info";
            highlight = "RenderMarkdownInfo";
          };
          todo = {
            raw = "[!TODO]";
            rendered = "󰗡 Todo";
            highlight = "RenderMarkdownInfo";
          };
          hint = {
            raw = "[!HINT]";
            rendered = "󰌶 Hint";
            highlight = "RenderMarkdownSuccess";
          };
          success = {
            raw = "[!SUCCESS]";
            rendered = "󰄬 Success";
            highlight = "RenderMarkdownSuccess";
          };
          check = {
            raw = "[!CHECK]";
            rendered = "󰄬 Check";
            highlight = "RenderMarkdownSuccess";
          };
          done = {
            raw = "[!DONE]";
            rendered = "󰄬 Done";
            highlight = "RenderMarkdownSuccess";
          };
          question = {
            raw = "[!QUESTION]";
            rendered = "󰘥 Question";
            highlight = "RenderMarkdownWarn";
          };
          help = {
            raw = "[!HELP]";
            rendered = "󰘥 Help";
            highlight = "RenderMarkdownWarn";
          };
          faq = {
            raw = "[!FAQ]";
            rendered = "󰘥 Faq";
            highlight = "RenderMarkdownWarn";
          };
          attention = {
            raw = "[!ATTENTION]";
            rendered = "󰀪 Attention";
            highlight = "RenderMarkdownWarn";
          };
          failure = {
            raw = "[!FAILURE]";
            rendered = "󰅖 Failure";
            highlight = "RenderMarkdownError";
          };
          fail = {
            raw = "[!FAIL]";
            rendered = "󰅖 Fail";
            highlight = "RenderMarkdownError";
          };
          missing = {
            raw = "[!MISSING]";
            rendered = "󰅖 Missing";
            highlight = "RenderMarkdownError";
          };
          danger = {
            raw = "[!DANGER]";
            rendered = "󱐌 Danger";
            highlight = "RenderMarkdownError";
          };
          error = {
            raw = "[!ERROR]";
            rendered = "󱐌 Error";
            highlight = "RenderMarkdownError";
          };
          bug = {
            raw = "[!BUG]";
            rendered = "󰨰 Bug";
            highlight = "RenderMarkdownError";
          };
          example = {
            raw = "[!EXAMPLE]";
            rendered = "󰉹 Example";
            highlight = "RenderMarkdownHint";
          };
          quote = {
            raw = "[!QUOTE]";
            rendered = "󱆨 Quote";
            highlight = "RenderMarkdownQuote";
          };
          cite = {
            raw = "[!CITE]";
            rendered = "󱆨 Cite";
            highlight = "RenderMarkdownQuote";
          };
        };
      };
    };

    extraPackages = [ pkgs.python312Packages.pylatexenc ];
  };
}
