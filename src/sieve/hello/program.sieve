require [
	"comparator-i;ascii-numeric",
	"envelope",
	"environment",
	"fileinto",
	"imap4flags",
	"include",
	"relational",
	"regex",
	"reject",
	"spamtest",
	"variables"
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
