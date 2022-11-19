N = gets.to_i
N2 = N**2
require 'prime'
prime_hash = {}
Prime.each(N2 * 2) do |prime|
  prime_hash[prime] = true
end

if N.even?
  pairs = []
  dones = {}
  N.times do
    o = nil
    e = nil
    while(!o || dones[o] || !e || dones[e] || prime_hash[o+e]) do
      o = (rand(N2/2) * 2) + 1
      e = (rand(N2/2) + 1) * 2
    end
    dones[o] = true
    dones[e] = true
    pairs.push([o, e])
  end
  results = Array.new(N)
  c = 1
  0.upto(N/2 - 2) do |i|
    l = []
    N.times do
      while(dones[c]) do
        c += 2
      end
      l.push(c)
      dones[c] = true
    end
    results[i] = l
  end
  l1 = []
  l2 = []
  pairs.each do |o, e|
    l1.push(o)
    l2.push(e)
  end
  results[N/2-1] = l1
  results[N/2] = l2
  c = 2
  (N/2+1).upto(N-1) do |i|
    l = []
    N.times do
      while(dones[c]) do
        c += 2
      end
      l.push(c)
      dones[c] = true
    end
    results[i] = l
  end
else
  center_pairs = []
  o1 = 1
  o2 = 1
  e1 = 2
  e2 = 2
  while(o1 == o2 || e1 == e2 || prime_hash[o1+e1] || prime_hash[o2+e2] || prime_hash[o1+e2]) do
    o1 = (rand(N2/2) * 2) + 1
    o2 = (rand(N2/2) * 2) + 1
    e1 = (rand(N2/2) + 1) * 2
    e2 = (rand(N2/2) + 1) * 2
  end
  center_pairs[[o1,e1],[o2,e2]]
  dones[o1] = true
  dones[o2] = true
  dones[e1] = true
  dones[e2] = true
  pairs = []
  (N-2).times do |i|
    o = nil
    e = nil
    while(!o || dones[o] || !e || dones[e] || prime_hash[o+e]) do
      o = (rand(N2/2) * 2) + 1
      e = (rand(N2/2) + 1) * 2
    end
    dones[o] = true
    dones[e] = true
    pairs.push([o, e])
    results[i] = l
  end
  cl = []
  ((N/2)+1).times do |i|
  end
  results = Array.new(N)
  c = 1
  0.upto(N/2 - 2) do |i|
    l = []
    N.times do
      while(dones[c]) do
        c += 2
      end
      l.push(c)
      dones[c] = true
    end
  end
end
warn pairs.inspect
results.each do |l|
  puts l.join(' ')
end