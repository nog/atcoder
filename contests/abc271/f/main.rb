N = gets.to_i
map = Array.new N
N.times do |i|
  map[i] = gets.split.map(&:to_i)
end

map2 = Array.new(N){ Array.new(N)}
map2[0][0] = { 
  map[0][0] => 1
}
l1 = map[0]
l2 = map2[0]
1.upto(N-1) do |i|
  l2[i] = {
    l2[i-1] ^ l1[i] => 1
  }
end

1.upto(N-1) do |h|
  l1 = map[h]
  l2 = map2[h]

  h = {}
  k1 = map[h][0]
  map2[h-1][0].each do |k2, v|
    n = k2 ^ k1
    h[n] ||= 0
    h[n] += v
  end
  l2[0] = h
  1.upto(N-1) do |w|
  end
end