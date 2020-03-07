N, M, K = gets.split.map(&:to_i)
friends = Array.new N + 1
tree = Array.new N + 1
friends_map = Array.new N + 1
blocks = Array.new N + 1
blocks_list = Array.new N + 1
(N+1).times do |i|
  tree[i] = []
  friends[i] = []
  blocks_list[i] = []
  friends_map[i] = Array.new N + 1
  blocks[i] = Array.new N + 1
end

M.times do
  a, b = gets.split.map(&:to_i)
  friends[a].push b 
  friends[b].push a
  friends_map[a][b] = true
  friends_map[b][a] = true
end

K.times do
  a, b = gets.split.map(&:to_i)
  blocks_list[a].push b
  blocks_list[b].push a
  blocks[a][b] = true
  blocks[b][a] = true
end

searched = Array.new N + 1
results = []
N.times do |i|
  x = i + 1
  ans = {}
  if searched[x]
    xx = searched[x]
    r = (tree[xx] - blocks_list[x] - friends[x]).size
    unless friends_map[x][xx] || blocks[x][xx]
      r += 1
    end
    results.push r
    next
  end
  tree_hash = {}
  qq = friends[x].dup
  while q = qq.shift do
    friends[q].each do |ff|
      searched[q] ||= x
      next if friends_map[x][ff]
      next if tree_hash[ff]
      next if x == ff
      tree_hash[ff] = true
      qq.push(ff)
      next if blocks[x][ff]
      ans[ff] = true
    end
  end
  tree[x] = tree_hash.keys
  results.push ans.size
end

puts results.join(' ')