N = gets.to_i
A = gets.split.map(&:to_i)

xor = 0
hash = {}
A.each do |a|
  xor = xor ^ a
  hash[a] = true
end

A.each do |a|
  x = xor ^ a
  if x == 0
    warn "x: #{x}"
    puts 'Win'
    exit
  end
  unless hash[x]
    puts 'Win'
    exit
  end
end

puts 'Lose'