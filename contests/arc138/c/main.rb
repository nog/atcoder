N = gets.to_i
A = gets.split.map(&:to_i)

sorted = A.sort
res = sorted[N/2..-1].sum

half = sorted[(N/2)-1]
aa = A.map do |a|
  (a < half) ? +1 : -1
end

aaa = []
c = 0
mini = 0
min = 0
N.times do |i|
  c += aa[i]
  aaa.push(c)
  if c < min
    min = c
    mini = i
  end
end

# warn A.inspect
# warn aa.inspect
# warn aaa.inspect

puts [(mini + 1) % N, res].join(' ')