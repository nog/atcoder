N = gets.to_i

hash = {}
rule = /^[HDCS][A2-9TJQK]$/

N.times do
  s = gets.chomp
  unless s.match(rule)
    puts "No"
    exit
  end
  if hash[s]
    puts "No"
    exit
  end
  hash[s] = true
end

puts 'Yes'