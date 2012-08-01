-module(avis_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
  Children = [
    {
      avis_server_sup,
      {avis_server_sup, start_link, []},
      permanent, infinity, supervisor, [avis_server_sup]
    }, {
      avis_server_listener,
      {avis_server_listener, start_link, []},
      permanent, 5000, worker, [avis_server_listener]
    }
  ],
  {ok, { {one_for_one, 5, 10}, Children} }.

