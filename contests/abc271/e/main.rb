N, M, K = gets.split.map(&:to_i)
ABC = Array.new M
M.times do |i|
  ABC[i] = gets.split.map(&:to_i)
end
E = gets.split.map(&:to_i)
d = {
  1 => 0
}

E.each do |e|
  a, b, c = ABC[e-1]
  next unless d[a]
  r = []
  r.push(d[b]) if d[b]
  r.push(d[a] + c)
  d[b] = r.min
end

puts d[N] || -1