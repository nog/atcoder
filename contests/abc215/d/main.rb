N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

require 'prime'

pd_list = Array.new (10**5)+1
1.upto(10**5) do |i|
  pd_list[i] = i.prime_division.map{|x| x[0] }
end

primes = {}

A.each do |a|
  pd_list[a].each do |k|
    primes[k] = true
  end
end

result = []
1.upto(M) do |m|
  if pd_list[m].all?{|x| !primes[x] }
    result.push(m)
  end
end

puts result.size
result.each do |r|
  puts r 
end