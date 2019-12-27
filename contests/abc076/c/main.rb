s = gets.chomp
t = gets.chomp

reg = "^(.*)("
t.split('').each do |char|
  reg += "[#{char}|¥?]"
end
reg += ")(.*?)$"
regexp = Regexp.new(reg)
if m= s.match(regexp)
  puts "#{m[1]}#{t}#{m[3]}".gsub('?', 'a')
else
  puts "UNRESTORABLE"
end