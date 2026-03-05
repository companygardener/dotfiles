#!/usr/bin/env bash

stdin() {
	if read -t 0; then
        cat
    fi
}

show() {
	printf "\n$@\n"
}

error() {
	usage >&2

	if [[ ! -z "$1" ]]; then
		show "$(red "$1")" >&2
	fi

	exit 1
}

required() {
	[[ -z "${@:2}" ]] && error "Argument <$1> is required."
	eval "$1=\"${@:2}\""
}

optional() {
	local val="${@:2}"

	if [[ ! -z "$val" ]]; then
		# eval "$1=${val@Q}" # requires newer bash
		eval "$1=$(printf '%q' "$val")"
	else
		eval "unset $1"
	fi
}

run() {
	echo "$@"
	$@
}

trash() {
  mv $@ "$HOME/.Trash/"
}

wrapped() {
	required "start_code" $1
	required "str" $2
	required "end_code" $3

	printf "\e[${start_code}m${str}\e[${end_code}m"
}


color() {
	wrapped "$1" "${@:2}" 39
}

bold() {
	wrapped 1 "$@" 21
}

dim() {
	wrapped 2 "$@" 22
}

underline() {
	wrapped 4 "$@" 24
}

red() {
	color 31 "$@"
}

yellow() {
	color 33 "$@"
}

green() {
	color 32 "$@"
}

h1() {
	underline "$(green "$@")"
}

USAGE=""
NAME=""
n=$'\n'

usage_name() {
	required name $1
	optional desc "$(stdin)"

	NAME="$name"

	if [ ! -z "$desc" ]; then
		DESC="\n  $name – $desc\n"
	fi
}

usage_cmd() {
	required cmd $1
	optional params "${@:2}"
	optional desc "$(stdin)"

	args=""

	for p in $params; do
		if [[ $p == \<*\> ]]; then
			p="$(yellow "$p")"
		elif [[ $p == \[*\] ]]; then
			p="$p"
		else
			p="$(h1 "$p")"
		fi
		args+=" $p"
	done

	USAGE+="      $NAME $(h1 "$cmd")$args$n"

	if [ ! -z "$desc" ]; then
		USAGE+="        $desc"
	fi

	USAGE+="$n$n"
}

usage() {
	printf "$DESC\n  Usage:\n\n      $NAME $(yellow "<cmd>") [flags]\n\n${USAGE}"
}

rel_path() {
	ruby <<-END
		require "pathname"
		puts Pathname.new("$2").relative_path_from("$1")
	END
}

abs_path() {
	ruby <<-END
		require "pathname"
		puts Pathname.new("$1").realpath
	END
}
