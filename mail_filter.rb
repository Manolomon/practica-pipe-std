#!/usr/bin/ruby

VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def correo_valido? email
    email =~ VALID_EMAIL_REGEX
end

input = $stdin.gets

elements = input.split("\s")

elements.each do |a|
    if correo_valido?(a)
        $stdout.puts a
        $stdout.flush
    end
end