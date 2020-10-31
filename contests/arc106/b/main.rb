N, M = gets.split.map(&:to_i)

a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

c = Array.new M 
d = Array.new M 

class UnionFind
  def initialize(size)
    @rank = Array.new(size, 0)
    @parent = Array.new(size, &:itself)
  end

  def unite(id_x, id_y)
    x_parent = get_parent(id_x)
    y_parent = get_parent(id_y)
    return if x_parent == y_parent

    if @rank[x_parent] > @rank[y_parent]
      @parent[y_parent] = x_parent
    else
      @parent[x_parent] = y_parent
      @rank[y_parent] += 1 if @rank[x_parent] == @rank[y_parent]
    end
  end

  def get_parent(id_x)
    @parent[id_x] == id_x ? id_x : (@parent[id_x] = get_parent(@parent[id_x]))
  end

  def same_parent?(id_x, id_y)
    get_parent(id_x) == get_parent(id_y)
  end
end


M.times do |i|
    c[i], d[i] = gets.split.map(&:to_i)
end

if a.sum != b.sum
    puts 'No'
    exit
end

union = UnionFind.new N

M.times do |i|
    union.unite(c[i] - 1, d[i] - 1)
end

groups = {}

N.times do |i|
    parent = union.get_parent i
    groups[parent] ||= []
    groups[parent].push(i)
end

groups.values.each do |group|
    asum = 0
    bsum = 0
    group.each do |mem|
        asum += a[mem]
        bsum += b[mem]
    end

    if asum != bsum
        puts 'No'
        exit
    end
end

puts 'Yes'