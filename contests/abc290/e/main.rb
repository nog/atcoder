N = gets.to_i
A = gets.split.map(&:to_i)

positions = Array.new(N+1){ Array.new }
N.times do |i|
  a = A[i]
  positions[a].push(i)
end

sums = Array.new(2*N+1){ Array.new }

1.upto(N) do |i|
  positions[i].combination(2).each do |x|
    sums[x.sum].push(x[0])
  end
end

result = 0
warn sums.inspect
1.upto(2*N-1) do |s|
  if s.odd?
    cl = (s / 2)
    cr = cl + 1
    cnt = [cl, N-cr-1].min
    result += (1+cnt) * cnt / 2 - sums[s].sum
  else
    c = (s / 2)
    cnt = [c, N-c-1].min
    result += (1+cnt) * cnt / 2 - sums[s].sum
  end
end
puts result