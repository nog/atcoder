N, M = gets.split.map(&:to_i)
froms = Array.new(N){ Array.new(N) }
rl = Array.new(N){ Array.new }
M.times do |i|
  u, v = gets.split.map(&:to_i).map{|x| x - 1 }
  froms[v][u] = true
  rl[u].push(v)
end

result = 0
N.times do |a|
  fromsa = froms[a]
  rla = rl[a]
  i = 0
  while(b = rla[i]) do
    rl[b].each do |c|
      next if c == a
      next if fromsa[c]
      result += 1
      fromsa[c] = true
      rla.push(c)
    end
    i += 1
  end
end

puts result