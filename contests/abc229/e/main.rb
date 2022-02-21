N, M = gets.split.map(&:to_i)
routes =Array.new(N+1){ Array.new }

M.times do |i|
  a, b = gets.split.map(&:to_i)
  routes[a].push(b)
  routes[b].push(a)
end

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

dsu = DSU.new(N)
counts = N
results = []
N.times do |i|
  n = N - i
  results.push(counts - n)

  routes[n].find_all{|x| x > n}.each do |x|
    next if dsu.same(n-1, x-1)
    dsu.merge(n-1, x-1)
    counts -= 1
  end
end

results.reverse.each do |r|
  puts r
end