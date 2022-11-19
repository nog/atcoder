N = gets.to_i
A= gets.split.map(&:to_i)
hash = {}
hash[1] = [nil, 0]

N.times do |i|
  par = A[i]
  parc = hash[par][1]
  [2*(i+1), 2*(i+1)+1].each do |ch|
    hash[ch] = [par, parc+1]
  end
end

# warn hash.inspect
res = []
1.upto(2*N+1) do |k|
  puts hash[k][1]
end