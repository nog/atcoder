# Disjoint Set Union
class DSU
  def initialize(n = 0)
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

  def [](a)
    if @n <= a
      @parent_or_size.concat([-1] * (a - @n + 1))
      @n = @parent_or_size.size
    end

    @parent_or_size[a] < 0 ? a : (@parent_or_size[a] = self[@parent_or_size[a]])
  end

  def size(a)
    -@parent_or_size[leader(a)]
  end

  def groups
    (0 ... @parent_or_size.size).group_by{ |i| leader(i) }.values
  end

  def to_s
    "<#{self.class}: @n=#{@n}, #{@parent_or_size}>"
  end
end

UnionFind = DSU

N, Q = gets.split.map(&:to_i)

dsu = DSU.new(N+Q)
cnt = N
boxes = Array.new(N){|i| i }
leaders = Array.new(N){|i| i }

Q.times do
  op, x, y = gets.split.map(&:to_i)
  if op == 1
    x -= 1
    y -= 1
    next unless leaders[y]
    l = nil
    if leaders[x]
      dsu.merge(leaders[x], leaders[y])
      l = dsu.leader(leaders[x])
    else
      l = dsu.leader(leaders[y])
    end
    leaders[y] = nil
    leaders[x] = l
    boxes[l] = x
  elsif op == 2
    x -= 1
    if leaders[x]
      dsu.merge(dsu.leader(leaders[x]), cnt)
      boxes[cnt] = x
    else
      leaders[x] = cnt
      boxes[cnt] = x
    end
    cnt += 1
  elsif op == 3
    x -= 1
    l = dsu.leader(x)
    puts boxes[l] + 1
  else
    raise
  end
end