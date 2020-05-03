k = gets.to_i
a, b = gets.split.map(&:to_i)

if (a/k.to_f).ceil * k <= b
  puts "OK"
else
  puts "NG"
end