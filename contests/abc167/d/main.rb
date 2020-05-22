n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

hash = { 1 => 0}
keiro = [1]
current = 1
nex = nil
count = 0
while true do
  nex = a[current-1]
  keiro.push(nex)
  break unless hash[nex].nil?
  count += 1
  hash[nex] = count
  current = nex
end

if keiro.size - 1 >= k
  puts keiro[k]
  exit
end

start = hash[nex]
loop = keiro[start..-1]

before_loop = keiro.size - loop.size
k = k - before_loop
k = k % (loop.size - 1)
puts loop[k]