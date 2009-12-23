#!/usr/bin/env ruby
ARGF.each_line do |i|
  if i.match /^[^#s\t].*$/
	puts "Error on line #{ARGF.lineno}: #{line}"
	exit 1
  end
end
