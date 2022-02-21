N, M = gets.split.map(&:to_i)
D = gets.split.map(&:to_i)

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
dsu = DSU.new(N)
routes = {}
counts = Array.new N, 0
M.times do |i|
  a, b = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  routes[a] ||= {}
  routes[b] ||= {}
  routes[a][b] = true
  routes[b][a] = true
  counts[a] += 1
  counts[b] += 1
  dsu.merge(a,b)
end
counts = N - M - 1
results = []

diffs = Array.new N, 0
targets = []

ldiffs = {}
ltargets = {}

N.times do |i|
  d = D[i]
  diff = d - (routes[i] || {}).size
  if diff < 0
    puts -1
    exit
  end
  l= dsu.leader(i)
  ldiffs[l] ||= 0
  ltargets[l] ||= []
  if diff > 0
    ldiffs[l] += diff
    ltargets[l].push(i)
    targets.push(i)
    diffs[i] = diff
  end
end
warn diffs.inspect
warn ldiffs.inspect

if ldiffs.values.include?(0)
  warn "C"
  puts -1
  exit
end
# if diffs.sum != counts * 2
#   warn "B"
#   puts -1
#   exit
# end

llist = ldiffs.to_a.sort_by{|a| a[1]}.reverse!

maxg = llist.shift
maxc = maxg[1]
maxtargets = ltargets[maxg[0]]

def die
  puts -1
  exit
end

while(llist[0]) do
  tg = llist.shift
  die unless maxtargets[0]
  a = maxtargets.shift
  diffs[a] -= 1
  ttargets = ltargets[tg[0]]
  b = ttargets.shift
  diffs[b] -= 1
  maxtargets.push(*ttargets)
  results.push([a,b])
  if diffs[a] > 0
    maxtargets.push(a)
  end
  if diffs[b] > 0
    maxtargets.push(b)
  end
end

# while(maxtargets.size > 0) do
#   a = maxtargets.shift
#   i = 0
#   res = false
#   while(b = maxtargets[i]) do
#     if routes[a] && routes[a][b]
#       i += 1
#     else
#       maxtargets.delete(i)
#       res = true
#       break
#     end
#   end
#   die unless res
#   diffs[a] -= 1
#   diffs[b] -= 1
#   maxtargets.push(a) if diffs[a] > 0
#   maxtargets.push(b) if diffs[b] > 0
# end
die if maxtargets[0]
die unless results.size == counts

results.each do |x|
  puts x.map{|a| a + 1}.join(' ')
end