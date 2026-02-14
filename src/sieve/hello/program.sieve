require [
	"comparator-i;ascii-numeric",
	"envelope",
	"environment",
	"regex",
	"reject",
	"variables",
	"vnd.dovecot.debug"
];

if header :matches "Subject" "*" { set :lower "subject" "${1}"; }

if string :is "${subject}" "alpha"
{
	debug_log "Hello, Mercury!";
}
elsif anyof(
	string :is "${subject}" "beta",
	string :is "${subject}" "gamma")
{
	debug_log "Hello, Venus!";
}
elsif string :is "${subject}" "delta"
{
	debug_log "Hello, world!";
}
elsif string :is "${subject}" "epsilon"
{
	debug_log "Hello, Mars!";
}
else
{
	debug_log "Hello, Jupiter!";
}
