N, M = gets.split.map(&:to_i)
AB = Array.new M
counts = Array.new(N+1){ Hash.new }

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

dsu = DSU.new N
M.times do |i|
  a, b = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  if dsu.same?(a, b)
    puts 'No'
    exit
  end
  dsu.merge(a, b)
  counts[a][b] = true
  counts[b][a] = true
end

(N+1).times do |i|
  next unless counts[i]
  if counts[i].keys.size > 2
    puts 'No'
    exit
  end
end
puts 'Yes'