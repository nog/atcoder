N, C = gets.split.map(&:to_i)
x = C
ops = Array.new(30){ [0, 1] }
ta = []
N.times do |i|
  t, a  = gets.split.map(&:to_i)
  if t == 1
    30.times do |i|
      op = ops[i]
      ops[i] = [op[0] & a[i], op[1] & a[i]]
    end
  elsif t == 2
    30.times do |i|
      op = ops[i]
      ops[i] = [op[0] | a[i], op[1] | a[i]]
    end
  elsif t == 3
    30.times do |i|
      op = ops[i]
      ops[i] = [op[0] ^ a[i], op[1] ^ a[i]]
    end
  else
    raise
  end
  # warn ops.inspect
  r = 0
  30.times do |i|
    r += 2**i if ops[i][x[i]] == 1
  end
  puts r
  x = r
end