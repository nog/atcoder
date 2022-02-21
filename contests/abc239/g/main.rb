# MaxFlowGraph
class MaxFlow
  def initialize(n)
    @n   = n
    @pos = []
    @g   = Array.new(n) { [] }
  end

  def add_edge(from, to, cap)
    edge_number = @pos.size

    @pos << [from, @g[from].size]

    from_id = @g[from].size
    to_id   = @g[to].size
    to_id += 1 if from == to
    @g[from] << [to,   to_id,   cap]
    @g[to]   << [from, from_id, 0]

    edge_number
  end

  def add_edges(edges)
    edges.each{ |from, to, cap| add_edge(from, to, cap) }
    self
  end

  def add(x, to = nil, cap = nil)
    cap ? add_edge(x, to, cap) : add_edges(x)
  end

  def push(edge)
    add_edge(*edge)
  end
  alias << push

  # return edge = [from, to, cap, flow]
  def [](i)
    _e  = @g[@pos[i][0]][@pos[i][1]]
    _re = @g[_e[0]][_e[1]]
    [@pos[i][0], _e[0], _e[-1] + _re[-1], _re[-1]]
  end
  alias get_edge []
  alias edge []

  def edges
    @pos.map do |(from, id)|
      _e  = @g[from][id]
      _re = @g[_e[0]][_e[1]]
      [from, _e[0], _e[-1] + _re[-1], _re[-1]]
    end
  end

  def change_edge(i, new_cap, new_flow)
    _e  = @g[@pos[i][0]][@pos[i][1]]
    _re = @g[_e[0]][_e[1]]
    _e[2]  = new_cap - new_flow
    _re[2] = new_flow
  end

  def flow(s, t, flow_limit = 1 << 64)
    level = Array.new(@n)
    iter  = Array.new(@n)
    que   = []

    flow = 0
    while flow < flow_limit
      bfs(s, t, level, que)
      break if level[t] == -1

      iter.fill(0)
      while flow < flow_limit
        f = dfs(t, flow_limit - flow, s, level, iter)
        break if f == 0

        flow += f
      end
    end

    flow
  end
  alias max_flow flow

  def min_cut(s)
    visited = Array.new(@n, false)
    que = [s]
    while (q = que.shift)
      visited[q] = true
      @g[q].each do |(to, _rev, cap)|
        if cap > 0 && !visited[to]
          visited[to] = true
          que << to
        end
      end
    end
    visited
  end

  private

  def bfs(s, t, level, que)
    level.fill(-1)
    level[s] = 0
    que.clear
    que << s

    while (v = que.shift)
      @g[v].each do |e|
        next if e[2] == 0 || level[e[0]] >= 0

        level[e[0]] = level[v] + 1
        return nil if e[0] == t

        que << e[0]
      end
    end
  end

  def dfs(v, up, s, level, iter)
    return up if v == s

    res = 0
    level_v = level[v]

    while iter[v] < @g[v].size
      i = iter[v]
      e = @g[v][i]
      cap = @g[e[0]][e[1]][2]
      if level_v > level[e[0]] && cap > 0
        d = dfs(e[0], (up - res < cap ? up - res : cap), s, level, iter)
        if d > 0
          @g[v][i][2] += d
          @g[e[0]][e[1]][2] -= d
          res += d
          break if res == up
        end
      end
      iter[v] += 1
    end

    res
  end
end

N, M = gets.split.map(&:to_i)
AB = Array.new M 
routes = {}
M.times do |i|
  a, b = gets.split.map(&:to_i)
  a, b = a - 1, b - 1
  routes[a] ||= []
  routes[b] ||= []
  routes[a].push(b)
  routes[b].push(a)
  AB[i] = [a, b]
end
C = gets.split.map(&:to_i)

mflow = MaxFlow.new 2*N
inf = Float::INFINITY
N.times do |i|
  if i == 0 || i == N - 1
    mflow.add_edge(2*i, 2*i+1, inf)
  else
    mflow.add_edge(2*i, 2*i+1, C[i])
  end
end
M.times do |i|
  a, b = AB[i]
  mflow.add_edge(2*a+1, 2*b, inf)
  mflow.add_edge(2*b+1, 2*a, inf)
end
# warn AB.inspect
# warn C.inspect
# warn mflow.inspect
puts mflow.flow(1, 2*(N-1))
cut = mflow.min_cut(0)
warn cut.inspect

reshash = {}
N.times do |i|
  if cut[2*i]
    routes[i].each do |to|
      unless cut[2*to]
        reshash[i] = true
      end
    end
  end
end

keys = reshash.keys
puts keys.size
puts keys.map{|k| k + 1}.join(' ')