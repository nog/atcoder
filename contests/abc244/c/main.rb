N = gets.to_i

hash = {}
1.upto(2*N+1) do |i|
  hash[i] = true
end

(N+1).times do
  k, v = hash.first
  puts k
  STDOUT.flush
  hash.delete(k)
  x = gets.to_i
  hash.delete(x)
end