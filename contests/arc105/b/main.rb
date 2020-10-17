N = gets.to_i
a = gets.split.map(&:to_i).sort

puts a.inject(a[0]){|res, item| res.gcd(item)}