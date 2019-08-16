sub valid_ip {
	my ($ip) = @_;
	#Given a string, it checks whether it is a valid IP name (returns "n"),
	#or valid IPv4 address (returns "4"), or valid IPv6 address returns "6").
	#If invalid it returns "0";
	#For IP name see: http://stackoverflow.com/questions/106179/regular-expression-to-match-hostname-or-ip-address
	#For IPv4 address see: http://answers.oreilly.com/topic/318-how-to-match-ipv4-addresses-with-regular-expressions/
	#For IPv6 address see: http://forums.dartware.com/viewtopic.php?t=452
	#Test cases for IPv6 address (we are using aeron) see http://download.dartware.com/thirdparty/test-ipv6-regex.pl
	#Examples:
	if(length($ip)<256) {
		if($ip=~/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/){#IPv4 address
			return "4";
		}elsif($ip=~/^(((?=(?>.*?::)(?!.*::)))(::)?([0-9A-F]{1,4}::?){0,5}|([0-9A-F]{1,4}:){6})(\2([0-9A-F]{1,4}(::?|$)){0,2}|((25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.|$)){4}|[0-9A-F]{1,4}:[0-9A-F]{1,4})(?<![^:]:)(?<!\.)\z/i) {#IPv6 Address
			return "6";
		}elsif($ip=~/^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])(\.([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9]))*$/) {#Name
			#if($ip=~/(([a-z0-9]+|([a-z0-9]+[-]+[a-z0-9]+))[.])+/) {#Name
			return "n";
		}
	}
	return "0";
}
