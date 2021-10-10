N, M, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
MOD = 998244353

@routes = Array.new(N+1){ Array.new }
(N-1).times do |i|
  u, v = gets.split.map(&:to_i)
  @routes[u].push([i,v])
  @routes[v].push([i,u])
end

@parents = Array.new N+1
@childs = Array.new(N+1){ Array.new }
@depth = Array.new N+1
@parent_edges = Array.new N+1

def search node, parent, depth
  @depth[node] = depth
  ndepth = depth + 1
  @routes[node].each do |edge, c|
    next if c == parent
    @childs[node].push(c)
    @parents[c] = node
    @parent_edges[c] = edge
    search c, node, ndepth
  end
end
search 1, 0, 0

# warn "parent_edges"
# warn @parent_edges.inspect
# warn "depth"
# warn @depth.inspect

@edge_counts = Array.new N-1, 0

1.upto(M-1) do |i|
  a = A[i]
  b = A[i-1]

  while(a != b)
    adepth = @depth[a]
    bdepth = @depth[b]
    if adepth > bdepth
      edge = @parent_edges[a]
      @edge_counts[edge] += 1
      a = @parents[a]
    elsif bdepth > adepth
      edge = @parent_edges[b]
      @edge_counts[edge] += 1
      b = @parents[b]
    else
      edge = @parent_edges[a]
      @edge_counts[edge] += 1
      a = @parents[a]
      edge = @parent_edges[b]
      @edge_counts[edge] += 1
      b = @parents[b]
    end
  end
end

# warn "edge_counts"
# warn @edge_counts.inspect

edge_count_sum = @edge_counts.sum

# warn "sum"
# warn edge_count_sum
# warn "k"
# warn K

bsum2 = edge_count_sum - K.abs
asum2 = edge_count_sum + K.abs
if bsum2.odd?
  puts 0
  exit
end

asum = asum2 / 2
bsum = bsum2 / 2

hash = { 0 => 1 }
counts = @edge_counts.sort.reverse

counts.each do |c|
  next if c > asum
  hash.keys.sort.reverse.each  do |k|
    n = k+c
    next if n > asum
    hash[n] = (hash[n] || 0) + hash[k] % MOD
  end
end

# warn hash.inspect

puts (hash[asum] || 0 ) % MOD