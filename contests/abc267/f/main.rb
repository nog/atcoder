N = gets.to_i
@parents = Array.new(N)
@routes = Array.new(N){ Array.new }
(N-1).times do
  a, b = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  @routes[a].push(b)
  @routes[b].push(a)
end
max = 0
root = 0
N.times do |i|
  cnt = @routes[i].size
  if cnt > max
    max = cnt
    root = i
  end
end

@levels = Array.new(N)
@parents[0] = -1
@groups = Array.new(N)
@groups[root] = root
def dfs point, level, group
  @levels[point] = level
  @groups[point] ||= group
  @routes[point].each do |to|
    next if @levels[to]
    @parents[to] = point
    dfs to, level+1, (group || to)
  end
end
dfs root, 0, nil

@levelto_points = Array.new(2*N){ [] }
N.times do |i|
  l = @levels[i]
  @levelto_points[l].push(i)
end
# warn @levels.inspect
# warn @levelto_points.inspect
# warn @groups.inspect
Q = gets.to_i
Q.times do
  u, k = gets.split.map(&:to_i)
  u -= 1
  if u == root
    puts (@levelto_points[k][0] || -2) + 1
    next
  end
  l = @levels[u]
  g = @groups[u]
  if k >= l
    puts (@levelto_points[k-l].find{|x|
      @groups[x] != g
    } || @levelto_points[k+l].find{|x|
      @groups[x] != g
    } || -2) + 1
    next
  else
    puts (@levelto_points[l-k].find{|x|
      @groups[x] == g
    } || @levelto_points[l+k].find{|x|
      @groups[x] == g
    } || -2) + 1
    next
  end
end