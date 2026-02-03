#!/usr/bin/env bash

if [[ ! -f program.exe ]]; then
	declare ml64_path='C:\Program Files\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14*\bin\Hostx64\x64\ml64.exe'

	wine "$ml64_path" /c /Foprogram.obj program.asm
	wine link.exe /subsystem:console /entry:main program.obj kernel32.lib

	# TODO
fi

wine program.exe

# TODO
