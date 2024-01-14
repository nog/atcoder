N, M = gets.split.map(&:to_i)
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

@dsu = DSU.new(N)

M.times do
  u, v = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  @dsu.merge(u, v)
end

hash = {}
K = gets.to_i
K.times do 
  x, y = gets.split.map(&:to_i)
  x -= 1
  y -= 1
  lx = @dsu.leader(x)
  ly = @dsu.leader(y)
  hash["#{lx}-#{ly}"] = true
  hash["#{ly}-#{lx}"] = true
end
Q = gets.to_i
Q.times do
  x, y = gets.split.map(&:to_i)
  x -= 1
  y -= 1
  lx = @dsu.leader(x)
  ly = @dsu.leader(y)
  if hash["#{lx}-#{ly}"] || hash["#{ly}-#{lx}"]
    puts "No"
  else
    puts "Yes"
  end
end