
all: compile

get-deps:
	./rebar get-deps

compile: get-deps
	./rebar compile

run: compile
	erl -sname fnd -pa apps/*/ebin -pa deps/*/ebin -boot start_sasl -s avis
