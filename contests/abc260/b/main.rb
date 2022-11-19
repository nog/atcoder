N, X, Y, Z = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

hash = {}

alist = []
blist = []
zlist = []
N.times do |i|
  alist.push([-A[i], i])
  blist.push([-B[i], i])
  zlist.push([-A[i] - B[i], i])
end
alist.sort!
blist.sort!
zlist.sort!

X.times do |i|
  a, j = alist[i]
  hash[j] = true
end

y = Y
while(y > 0) do
  b, j = blist.shift
  next if hash[j]
  hash[j] = true
  y -= 1
end

z = Z
while(z > 0) do
  c, j = zlist.shift
  next if hash[j]
  hash[j] = true
  z -= 1
end

hash.keys.sort.each do |k|
  puts k + 1
end