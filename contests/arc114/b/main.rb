N = gets.to_i
F = [false] + gets.split.map(&:to_i)
MOD =998244353

class DSU
  def initialize(n = 0)
    # root node: -1 * component size
    # otherwise: parent
    @parent_or_size = Array.new(n, -1)
  end

  attr_accessor :parent_or_size

  def merge(a, b)
    x = leader(a)
    y = leader(b)
    return x if x == y

    x, y = y, x if -@parent_or_size[x] < -@parent_or_size[y]
    @parent_or_size[x] += @parent_or_size[y]
    @parent_or_size[y] = x
  end
  alias unite merge

  def same(a, b)
    leader(a) == leader(b)
  end
  alias same? same

  def leader(a)
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

UnionFind        = DSU
UnionFindTree    = DSU
DisjointSetUnion = DSU

dsu = DSU.new(N+1)
1.upto(N) do |i|
    # warn i
    dsu.unite(i, F[i])
end
# warn dsu.groups.inspect
puts 2.pow(dsu.groups.size - 1, MOD) - 1
exit


revf = Array.new(N+1){ Array.new }
1.upto(N) do |i|
    a = F[i]
    revf[a].push(i)
end
warn revf.inspect

groups = {}
1.upto(N) do |i|
    next if revf[i].size > 1
    next if revf[i].size == 1 && i != F[i]
    hash = {}
    cnt = 1
    hash[i] = cnt
    j = F[i]
    while(!hash[F[j]]) do
        cnt += 1
        hash[j] = cnt
        j = F[j]
    end
    groups[i] = {
        count: cnt,
        loop: j,
        loop_cnt: hash[F[j]],
    }
end
warn groups.inspect
loops = {}

groups.each do |i, g|
    l = g[:loop]
    lcnt = g[:loop_cnt] - 1
    if loops[l]
        loops[l][:eda].push([i, lcnt])
    elsif lcnt == 0
        loops[l] = {
            eda: []
        }
    else
        loops[l] = {
            eda: [[i, lcnt]]
        }
    end
end

warn loops.inspect
result = 1
loops.each do |_, l|
    cnt = 2
    l[:eda].each do |eda|
        cnt += eda[1]
    end
    result *= cnt
end

puts 2.pow(loops.size, MOD) - 1