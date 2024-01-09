#!/bin/bash

assert() {
	expected="$1"
	input="$2"

	# exit if run fail
	./rvcc $input >tmp.S || exit

	riscv64-linux-gnu-gcc -static -o tmp tmp.S

	qemu-riscv64 -L /usr/riscv64-linux-gnu ./tmp

	# get the return value
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected, but got $actual"
		exit 1
	fi
}

assert 0 0
assert 42 42
