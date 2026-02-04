#!/usr/bin/env bash

export WINEDEBUG="-all"
export XDG_RUNTIME_DIR=~

wine64 wineboot 2> /dev/null

if [[ ! -f program.exe ]]; then
	declare libpath link ml64

	libpath='Z:\opt\msvc\Windows Kits\10\Lib\10.0.26100.0\um\x64'
	link=$(realpath '/opt/msvc/VC/Tools/MSVC/14'*'/bin/Hostx64/x64/link.exe')
	ml64=$(realpath '/opt/msvc/VC/Tools/MSVC/14'*'/bin/Hostx64/x64/ml64.exe')

	wine64 "$ml64" /c /Foprogram.obj program.asm > /dev/null 2>&1
	wine64 "$link" /subsystem:console /entry:main /libpath:"$libpath" 'program.obj' 'kernel32.lib' > /dev/null
fi

wine64 program.exe | dos2unix
