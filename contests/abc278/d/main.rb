N = gets.to_i
A = gets.split.map(&:to_i)
hash = {}
A.each.with_index do |a, i|
  hash[i+1] = a
end 
Q = gets.to_i
Q.times do
  q, a, b = gets.split.map(&:to_i)
  if q == 1
    hash = Hash.new(a)
  elsif q == 2
    hash[a] = hash[a] + b
  elsif q == 3
    puts hash[a]
  else
    raise
  end
end