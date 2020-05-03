n, m = gets.split.map(&:to_i)


# x
# x + 開催回数 - 1
# x + 開催回数 - 1 - n
m.times do |i|
  puts [i+1, n-i-1].join(' ')
end