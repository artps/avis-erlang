-module(avis).

-export([start/0]).

ensure_started(App) ->
    case application:start(App) of
        {error, {already_started, App}} -> ok;
        _ -> ok
    end.

start() ->
    Apps = [inets, avis],
    [ensure_started(App) || App <- Apps].
