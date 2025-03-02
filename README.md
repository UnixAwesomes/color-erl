## Color text
```erlang
io:format("~s~n", [color:green("Hello")]).
```

## Background text
```erlang
io:format("~s~n", [color:bg_blue("Hello")]).
```

## Gradient text

```erlang
Text = gradient:create([red, green, blue], "Text").
io:format("~s~n", [lists:flatten(Text)]).
```
