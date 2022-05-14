N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
Q = gets.to_i
MOD = 10**9+7

nummap = {}
powmap = []
c = 1
i = 0
(A + B).uniq.each do |l|
  nummap[l] = i
  powmap.push(c)
  c = c * 2 % MOD
  i += 1
end

#  warn nummap.inspect

alist = Array.new
blist = Array.new
ca = 0
cb = 0
adid = {}
bdid = {}
N.times do |i|
  a = nummap[A[i]]
  b = nummap[B[i]]

  unless adid[a]
    ca = ca + powmap[a] % MOD
    adid[a] = true
  end
  unless bdid[b]
    cb = cb + powmap[b] % MOD
    bdid[b] = true
  end
  alist.push(ca)
  blist.push(cb)
end
# warn alist.inspect
# warn blist.inspect

Q.times do |i|
  x, y = gets.split.map(&:to_i)
  x -= 1
  y -= 1
  puts ( alist[x] == blist[y] ) ? 'Yes' : 'No'
end