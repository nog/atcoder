MOD = 998244353
N = gets.to_i
A = gets.to_i
B = gets.to_i

a = b = nil
if A > B 
  a = A.to_s.split('').map(&:to_i)
  b = B.to_s.split('').map(&:to_i)
else
  a = B.to_s.split('').map(&:to_i)
  b = A.to_s.split('').map(&:to_i)
end

pattern = []

alist = [a.shift]
blist = [b.shift]
(N-1).times do |i|
  aa = a.shift 
  bb = b.shift
  if bb > aa 
    alist.push(bb)
    blist.push(aa)
  else
    alist.push(aa)
    blist.push(bb)
  end
end

puts (alist.join('').to_i % MOD) * (blist.join('').to_i % MOD) % MOD