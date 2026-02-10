require [
	"fileinto",
	"imap4flags",
	"reject",
	"variables"
];

if header :matches "Subject" "*" { set :lower "subject" "${1}"; }
if header :matches "List-Unsubscribe" "*" { set :lower "list_unsubscribe" "${1}"; }

if address :all :matches "From" "*" { set :lower "from" "${1}"; }
if address :domain :matches "From" "*" { set :lower "from_domain" "${1}"; }
if address :localpart :matches "From" "*" { set :lower "from_user" "${1}"; }

if address :all :matches "To" "*" { set :lower "to" "${1}"; }
if address :domain :matches "To" "*" { set :lower "to_domain" "${1}"; }
if address :localpart :matches "To" "*" { set :lower "to_user" "${1}"; }

if string :is "${from_domain}" "spam.com"
{
	reject "Emails from this domain are not accepted.";
}
elsif string :is "${to_user}" "junk"
{
	addflag "\\Seen";
	fileinto "Junk";
	keep;
}
elsif anyof (
	string :is "${from}" "auto-confirm@amazon.com",
	string :is "${from}" "digital-no-reply@amazon.com",
	string :is "${from}" "order-update@amazon.com",
	string :is "${from}" "shipment-tracking@amazon.com")
{
	fileinto "Notifications/Amazon";
	addflag "\\Seen";
	keep;
}
elsif allof (
	string :contains "${subject}" "report domain",
	string :contains "${subject}" "submitter")
{
	fileinto "Notifications/DMARC Reports";
	addflag "\\Seen";
	keep;
}
elsif not string :is "${list_unsubscribe}" ""
{
	fileinto "List-Marker";
	fileinto "Lists";
	keep;
}

stop;
