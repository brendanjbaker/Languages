Module: program

define function main
		(name :: <string>, arguments :: <vector>)

	format-out("Hello, world!\n");
	exit-application(0);
end function;

main(application-name(), application-arguments());
