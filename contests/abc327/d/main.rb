class UnionFind
    def initialize(n)
      @parent = Array.new(n, &:itself)
    end
  
    def find(x)
      return x if @parent[x] == x
      @parent[x] = find(@parent[x])
    end
  
    def unite(x, y)
      px = find(x)
      py = find(y)
      return if px == py
      @parent[py] = px
    end
  
    def same?(x, y)
      find(x) == find(y)
    end
  end
  
  n, m = gets.split.map(&:to_i)
  uf = UnionFind.new(n+1)
  good_pair = true
 
  A = gets.split.map(&:to_i)
  B = gets.split.map(&:to_i)

  routes = {}
  m.times do |i|
    a, b = A[i], B[i]
    routes[a] ||= []
    routes[b] ||= []
    if routes[a].size > 0
        uf.unite(b, routes[a][0])
    end
    if routes[b].size > 0
        uf.unite(a, routes[b][0])
    end
    routes[a].push(b)
    routes[b].push(a)

    if uf.same?(a, b)
      good_pair = false
      break
    end
  end
  
  puts good_pair ? 'Yes' : 'No'
  