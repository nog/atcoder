n, m = gets.split.map(&:to_i)


# x
# x + 開催回数 - 1
# x + 開催回数 - 1 - n
# x - y
# y - x + n
# 1 10000 10000
# 1 10000
# 1 + 9999 , 10000 + 9999 - 10000
m.times do |i|
  puts [i+1, n-i-1].join(' ')
end