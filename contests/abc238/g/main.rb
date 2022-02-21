N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

primes = []
require 'prime'
Prime.each(A.max ** 0.5) do |pr|
  primes.push(pr)
end
llist = {}
rlist = {}
hashes = Array.new(Q){ Hash.new 0 }
results = Array.new Q
Q.times do |i|
  l, r = gets.split.map(&:to_i)
  l-=1
  r-=1
  llist[l] ||= []
  llist[l].push(i)
  rlist[r] ||= []
  rlist[r].push(i)
end

cur = {}

N.times do |i|
  a = A[i]
  plist = []
  primes.each do |pr|
    break if a < pr
    next if a % pr > 0
    cnt = 1
    a = a / pr
    while(a % pr == 0) do
      cnt += 1
      a /= pr
    end
    plist.push([pr, cnt])
  end
  if a > 1
    plist.push([a, 1])
  end

  (llist[i] || []).each do |j|
    cur[j] = true
  end

  cur.keys.each do |i|
    h = hashes[i]
    plist.each do |pr, cnt|
      h[pr] += cnt
    end
  end

  (rlist[i] || []).each do |j|
    results[j] = hashes[j].all?{|k,v| (v % 3) == 0}
    cur.delete(j)
  end
end

puts results.map{|x| x ? 'Yes' : 'No'}.join("\n")
