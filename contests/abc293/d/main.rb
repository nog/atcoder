N, M = gets.split.map(&:to_i)
ABCD = []

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

dsu = DSU.new(N)

M.times do |i|
  a, b, c, d = gets.split.map(&:to_i)
  ABCD.push([a,b,c,d])
  dsu.merge(a-1, c-1)
end

counts = Array.new(N){ 0 }
ABCD.each do |a,b,c,d|
  l = dsu.leader(a-1)
  counts[l] += 1
end
x = 0
y = 0
# warn counts.inspect
# warn dsu.groups.inspect
dsu.groups.each do |list|
  # warn list.inspect
  if list.size == counts[dsu.leader(list[0])]
    x += 1
  else
    y += 1
  end
end

puts [x, y].join(' ')