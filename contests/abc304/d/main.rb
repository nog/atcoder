W, H = gets.split.map(&:to_i)
N = gets.to_i
PQ = []
N.times do |i|
  PQ.push(gets.split.map(&:to_i))
end
PQ.sort!
A = gets.to_i
AL = gets.split.map(&:to_i)
B = gets.to_i
BL = gets.split.map(&:to_i)
AL.push(W)
BL.push(H)

counts = Hash.new 
qxi = []
AL.each.with_index do |x, i|
  while(PQ[0] && PQ[0][0] < x) do
    _p, _q = PQ.shift
    qxi.push([_q, i])
  end
end
qxi.sort!

max = 0

BL.each.with_index do |y, i|
  while(qxi[0] && qxi[0][0] < y) do
    _, xi = qxi.shift
    counts[xi] ||= {}
    cxi = counts[xi]
    cxi[i] ||= 0
    cxi[i] += 1
    if cxi[i] > max
      max = cxi[i]
    end
  end
end
min = nil

if (A+1)*(B+1) <= N
  list = []
  counts.values.each do |v|
    list.push *v.values
  end
  if list.size < (A+1)*(B+1)
    min = 0
  else
    min = list.min
  end
else
  min = 0
end

puts "#{min} #{max}"