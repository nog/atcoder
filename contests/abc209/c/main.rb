N = gets.to_i
C = gets.split.map(&:to_i)

MOD = 10**9+7

result = 1
sorted_c = C.sort
sorted_c.each.with_index do |c, i|
  if c <= i
    puts 0
    exit
  end
  result = (c - i) * result % MOD
end

puts result