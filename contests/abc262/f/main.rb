N, K = gets.split.map(&:to_i)
L = gets.split.map(&:to_i)
if K == 0
  puts L.join(' ')
  exit
end

def minimum list, k
  res = []
  while(k>0 && list.size > 0) do
    if res.size == 0
      res.push(list.shift)
    end
    break if list.size == 0
    if res[-1] < list[0]
      res.push(list.shift)
    else
      res.pop
      k -= 1
    end
  end
  if k > 0
    list = list[0...-k]
  end
  res + list
end

basemin = minimum(L.dup, K)
first = basemin[0]

kmin = N+10
kpos = nil
K.times do |k|
  pos = N - 1 - k
  if L[pos] < kmin
    kmin = L[pos]
    kpos = pos
    break if kmin == 1
  end
end

if kmin > first
  puts basemin.join(' ')
  exit
end

zk = K - (N - kpos)
zenhan = minimum(L[0...kpos].dup, zk)

x = zenhan + L[kpos..-1]
k = N - kpos
while(x[0] != kmin) do
  xx = x.pop
  k -= 1
  if xx < x[0]
    x.unshift(xx)
  end
end
r = minimum(x, k)
# r = x

if (basemin <=> r) == -1
  puts basemin.join(' ')
else
  puts r.join(' ')
end
