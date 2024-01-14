N, M = gets.split.map(&:to_i)

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


counts = Hash.new 0
dsu = DSU.new N
M.times do
  u, v = gets.split.map(&:to_i)
  counts[u] += 1
  counts[v] += 1
  dsu.merge(u-1, v-1)
end

# warn counts.inspect

if N - 1 != M
  puts "No"
  exit
end

count2 = 0
count1 = 0

1.upto(N) do |i|
  if counts[i] == 1
    count1 += 1
  elsif counts[i] == 2
    count2 += 1
  else
    puts "No"
    exit
  end
end

if count1 == 2 && count2  == N - 2 && dsu.groups.size == 1
  puts "Yes"
else
  puts "No"
end