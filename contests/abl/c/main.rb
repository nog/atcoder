N, M = gets.split.map(&:to_i)
A = Array.new M 
B = Array.new M


# frozen_string_literal: true

# Disjoint Set Union
class DSU
  def initialize(n = 0)
    # root node: -1 * component size
    # otherwise: parent
    @parent_or_size = Array.new(n) { -1 }
  end

  def merge(a, b)
    x = leader(a)
    y = leader(b)
    return x if x == y

    x, y = y, x if -@parent_or_size[x] < -@parent_or_size[y]
    @parent_or_size[x] += @parent_or_size[y]
    @parent_or_size[y] = x
    x
  end

  def same(a, b)
    leader(a) == leader(b)
  end

  def leader(a)
    @parent_or_size[a] < 0 ? a : (@parent_or_size[a] = leader(@parent_or_size[a]))
  end

  def size(a)
    -@parent_or_size[leader(a)]
  end

  def groups_with_leader
    h = Hash.new { |hash, key| hash[key] = [] }
    @parent_or_size.each_with_index do |parent_or_size, i|
      leader = parent_or_size < 0 ? i : parent_or_size
      h[leader] << i
    end
    h
  end

  def groups
    groups_with_leader.values
  end

  alias root leader
  alias find leader
  alias unite merge
  alias same? same
end

UnionFind        = DSU
UnionFindTree    = DSU
DisjointSetUnion = DSU


dsu = DSU.new N
M.times do |i|
    A[i], B[i] = gets.split.map(&:to_i)
    dsu.merge(A[i]-1, B[i]-1)
end
warn dsu.groups.inspect
puts dsu.groups.size- 1