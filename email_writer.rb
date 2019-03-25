#!/usr/bin/ruby

f = File.new(ARGV[0], 'w')
  
input = $stdin.gets

elements = input.split("\s")

elements.each do |a|
    f.write(a + "\n")
end

f.close 