N = gets.to_i
require 'prime'

max = Math.sqrt(N)
overs = []
1.upto(max) do |i|
    next if N % i > 0
    puts i
    o = N / i
    overs.push(o) if o != i
end

overs.reverse.each do |i|
    puts i
end