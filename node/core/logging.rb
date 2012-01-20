#
# Copyright (c) 2012, Stephen Fewer of Harmony Security (www.harmonysecurity.com)
# Licensed under a 3 clause BSD license (Please see LICENSE.txt)
# Source code located at https://github.com/stephenfewer/grinder
#
		
$version_major = 0
$version_minor = 1

$print_owner   = ''

def print_init( owner, print_banner=true )
	$print_owner = owner[0]
	if( print_banner )
		print_simple( '' )
		print_simple( '                       ______     _           __         ' )
		print_simple( '                      / ____/____(_)___  ____/ /__  _____' )
		print_simple( '                     / / __/ ___/ / __ \\/ __  / _ \\/ ___/' )
		print_simple( '                    / /_/ / /  / / / / / /_/ /  __/ /    ' )
		print_simple( '                    \\____/_/  /_/_/ /_/\\__,_/\\___/_/' )
		print_simple( '' )
		print_simple( '        By Stephen Fewer of Harmony Security (www.harmonysecurity.com)' )
		print_simple( "                                                 #{owner} - Version #{$version_major}.#{$version_minor}" )
		print_simple( '' )
	end
end

def print_simple( message )
	$stdout.puts( message )
end

def print_status( message )
	$stdout.puts( "[+#{$print_owner}+] #{message}" )
end

def print_warning( message )
	$stdout.puts( "[!#{$print_owner}!] #{message}" )
end

def print_error( message )
	$stdout.puts( "[-#{$print_owner}-] #{message}" )
end

def print_alert( message )
	$stdout.puts( "[*#{$print_owner}*] #{message}" )
end

# Modified from the Metasploit REX library (\msf3\lib\rex\text.rb) (BSD Licensed)
def to_hex_dump( str, offset=0, width=16 )
	buf, idx, cnt, snl, lst = '', 0, 0, false, 0
	while (idx < str.length)
		chunk = str[idx, width]
		line  = chunk.unpack("H*")[0].scan(/../).join(" ").upcase
		buf << "    0x#{'%08X' % (idx+offset)} - " << line
		if (lst == 0)
			lst = line.length
			buf << " " * 4
		else
			buf << " " * ((lst - line.length) + 4).abs
		end
		chunk.unpack("C*").each do |c|
			if (c >	0x1F and c < 0x7F)
				buf << c.chr
			else
				buf << "."
			end
		end
		buf << "\n"
		idx += width
	end
	buf << "\n"
end