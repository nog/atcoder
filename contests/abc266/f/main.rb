N = gets.to_i
class DSU
  def initialize(n)
    @n = n
    @parent_or_size = Array.new(n, -1)
    # root node: -1 * component size
    # otherwise: parent
  end

  attr_reader :parent_or_size, :n

  def merge(a, b)
    x = leader(a)
    y = leader(b)
    return x if x == y

    x, y = y, x if -@parent_or_size[x] < -@parent_or_size[y]
    @parent_or_size[x] += @parent_or_size[y]
    @parent_or_size[y] = x
  end
  alias unite merge

  def same?(a, b)
    leader(a) == leader(b)
  end
  alias same same?

  def leader(a)
    unless 0 <= a && a < @n
      raise ArgumentError.new, "#{a} is out of range (0...#{@n})"
    end

    @parent_or_size[a] < 0 ? a : (@parent_or_size[a] = leader(@parent_or_size[a]))
  end
  alias root leader
  alias find leader

  def size(a)
    -@parent_or_size[leader(a)]
  end

  def groups
    (0 ... @parent_or_size.size).group_by{ |i| leader(i) }.values
  end
end

UnionFind = DSU
@routes = {}
route_list = []
N.times do
  u, v = gets.split.map(&:to_i)
  route_list.push([u,v])
  @routes[u] ||= {}
  @routes[v] ||= {}
  @routes[u][v] = 1
  @routes[v][u] = 1
end

@dsu = DSU.new(N+1)

def dfs point, hash={},hist=[]
  if hash[point]
    # warn "looped #{point}: #{hist.inspect}"
    h0 = point
    hist.reverse.each do |h1|
      break if @dsu.same?(h0, h1)
      # warn "!!!h0:#{h0} h1:#{h1}"
      @dsu.merge(h0, h1)
      break if h1 == point
      h0 = h1
    end
  else
    b = hist[-1]
    hist.push(point)
    hash[point] = true
    @routes[point].each do |to, v|
      next if to == b
      dfs(to, hash, hist)
    end
    hash[point] = nil
    hist.pop
  end
end

dfs(1, {}, [])

dsu2 = DSU.new(N+1)
route_list.each do |from, to|
  next if @dsu.same?(from, to)
  dsu2.merge(from, to)
end


Q = gets.to_i
Q.times do
  x, y = gets.split.map(&:to_i)
  puts dsu2.same?(x, y) ? 'Yes' : 'No'
end