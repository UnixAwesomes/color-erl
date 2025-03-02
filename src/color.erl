-module(color).
-export([black/1, red/1, green/1, yellow/1, blue/1, magenta/1, cyan/1, white/1,
         bg_black/1, bg_red/1, bg_green/1, bg_yellow/1, bg_blue/1, bg_magenta/1, bg_cyan/1, bg_white/1,
         bold/1, underline/1, italic/1, format/2, reset/0]).

-define(STYLES, #{
    reset => 0,
    bold => 1,
    underline => 4,
    italic => 3,
    black => 30,
    red => 31,
    green => 32,
    yellow => 33,
    blue => 34,
    magenta => 35,
    cyan => 36,
    white => 37,
    bg_black => 40,
    bg_red => 41,
    bg_green => 42,
    bg_yellow => 43,
    bg_blue => 44,
    bg_magenta => 45,
    bg_cyan => 46,
    bg_white => 47
}).

apply_style(Styles, Text) ->
    Codes = [maps:get(Style, ?STYLES) || Style <- Styles],
    CodeStr = string:join([integer_to_list(C) || C <- Codes], ";"),
    "\e[" ++ CodeStr ++ "m" ++ Text ++ "\e[0m".


black(Text) -> apply_style([black], Text).
red(Text) -> apply_style([red], Text).
green(Text) -> apply_style([green], Text).
yellow(Text) -> apply_style([yellow], Text).
blue(Text) -> apply_style([blue], Text).
magenta(Text) -> apply_style([magenta], Text).
cyan(Text) -> apply_style([cyan], Text).
white(Text) -> apply_style([white], Text).

bg_black(Text) -> apply_style([bg_black], Text).
bg_red(Text) -> apply_style([bg_red], Text).
bg_green(Text) -> apply_style([bg_green], Text).
bg_yellow(Text) -> apply_style([bg_yellow], Text).
bg_blue(Text) -> apply_style([bg_blue], Text).
bg_magenta(Text) -> apply_style([bg_magenta], Text).
bg_cyan(Text) -> apply_style([bg_cyan], Text).
bg_white(Text) -> apply_style([bg_white], Text).

bold(Text) -> apply_style([bold], Text).
underline(Text) -> apply_style([underline], Text).
italic(Text) -> apply_style([italic], Text).

format(Styles, Text) -> apply_style(Styles, Text).

reset() -> "\e[0m".