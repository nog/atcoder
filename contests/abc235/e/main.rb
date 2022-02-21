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

N, M, Q = gets.split.map(&:to_i)

lines = Array.new M
M.times do |i|
  lines[i] = gets.split.map(&:to_i)
end
lines.sort_by!{|x| x[2]}

results = Array.new Q
queries = Array.new Q
Q.times do |i|
  u, v, w = gets.split.map(&:to_i)
  queries[i] = [u, v, w, i]
end
queries.sort_by!{|x| x[2] }

dsu = DSU.new N
while(u, v, w, i = queries.shift) do
  while(lines[0] && lines[0][2] < w) do
    a, b, c = lines.shift
    dsu.merge(a-1, b-1)
  end

  if dsu.same?(u-1, v-1)
    results[i] = false
  else
    results[i] = true
  end
end

Q.times do |i|
  puts results[i] ? 'Yes' : 'No'
end