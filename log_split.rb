input = File.open(ARGV[0]).read

elements = input.split("\n")

elements.each do |a|
    $stdout.print a + " "
    $stdout.flush
end