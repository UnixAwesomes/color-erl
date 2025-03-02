-module(gradient).
-export([create/2]).

create(Colors, Text) when is_list(Colors), length(Colors) > 0 ->
    TextList = unicode:characters_to_list(Text),
    Length = length(TextList),
    Step = max(1, Length / length(Colors)),
    apply_colors(Colors, TextList, Step, 0).

apply_colors(_, [], _, _) -> [];
apply_colors(Colors, [Char|Rest], Step, Index) ->
    ColorIndex = floor(Index / Step) rem length(Colors),
    Color = lists:nth(ColorIndex + 1, Colors),
    ColoredChar = apply_color(Color, [Char]),
    ColoredChar ++ apply_colors(Colors, Rest, Step, Index + 1).

apply_color(Color, Text) ->
    case erlang:function_exported(color, Color, 1) of
        true -> color:Color(Text);
        false -> throw({error, {unknown_color, Color}})
    end.