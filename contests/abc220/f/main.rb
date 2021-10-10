N = gets.to_i

@routes = {}
(N-1).times do 
  u, v = gets.split.map(&:to_i)
  @routes[u] ||= []
  @routes[v] ||= []
  @routes[u].push(v)
  @routes[v].push(u)
end

@dists = Array.new N
@nodes = Array.new N

def calc node, parent
  childs = @routes[node] - [parent]
  if childs.size == 0
    @dists[node] = 0
    @nodes[node] = 1
  else
    sum = 0
    nodes = 1
    childs.each do |child|
      calc child, node
      sum += @dists[child]
      nodes += @nodes[child]
    end
    @dists[node] = sum + nodes
    @nodes[node] = nodes
  end
end

calc 1, 0
warn "dists"
warn @dists.inspect
warn "nodes"
warn @nodes.inspect

@results = Array.new(N+1)
@results[1] = @dists[1]
warn "x:#{@results[1]}"

def calc2 node, parent
  @results[node] = @dists[node]
  childs = @routes[node] - [parent]
  bdistsnode = @dists[node]
  bnodesnode = @nodes[node]
  childs.each do |child|
    bdistschild = @dists[child]
    bnodeschild = @nodes[child]
    @nodes[node] = bnodesnode - bnodeschild
    @nodes[child] = bnodeschild + @nodes[node] + 1
    @dists[node] -= bdistschild - bnodeschild
    @dists[child] += @dists[node] + @nodes[node]
    calc2(child, node)
    @dists[node] = bdistsnode
    @dists[child] = bdistschild
    @nodes[node] = bnodesnode
    @nodes[child] = bnodeschild
  end
  warn @results.inspect
end
calc2 1, 0

1.upto(N) do |i|
  puts @results[i]
end