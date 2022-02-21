H, W, C, Q = gets.split.map(&:to_i)
queries = []
Q.times do
  queries.push(gets.split.map(&:to_i))
end
result = Array.new(C, 0)

t1 = {}
t2 = {}
t2c = 0
t1c = 0

queries.reverse.each do |t, n, c|
  if t == 1
    unless t1[n]
      t1[n] = c
      result[c-1] += W - t2c
      t1c += 1
    end
  elsif t == 2
    unless t2[n]
      t2[n] = c
      result[c-1] += H - t1c
      t2c += 1
    end
  else
    raise
  end
end

puts result.join(' ')