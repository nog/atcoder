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

N = gets.to_i
XY = Array.new(N)
map = Hash.new
N.times do |i|
  x, y = XY[i] = gets.split.map(&:to_i)
  map[x] ||= {}
  map[x][y] = i
end

dsu = DSU.new(N)

N.times do |i|
  x, y = XY[i]
  if t = map[x][y+1]
    dsu.merge(i, t)
  end
  if t = map[x][y-1]
    dsu.merge(i, t)
  end

  if map[x-1]
    if t = map[x-1][y]
      dsu.merge(i, t)
    end
    if t = map[x-1][y-1]
      dsu.merge(i, t)
    end
  end

  if map[x+1]
    if t = map[x+1][y+1]
      dsu.merge(i, t)
    end
    if t = map[x+1][y]
      dsu.merge(i, t)
    end
  end
end

puts dsu.groups.size