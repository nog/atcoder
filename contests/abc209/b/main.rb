N, X= gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

price = A.sum
price -= N / 2

if price <= X
  puts 'Yes'
else
  puts 'No'
end