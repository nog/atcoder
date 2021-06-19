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

H, W, N = gets.split.map(&:to_i)

nodes = 2 + H + W + 2 * N
start = 0
goal = nodes - 1
h_list = (1..H).to_a
w_list = (H+1..H+W).to_a
koma_list = (H+W+1..H+W+N).to_a
koma_list2 = (H+W+N+1..H+W+N+N).to_a

flow = MaxFlow.new(nodes)
h_list.each do |h|
  flow.add_edge(start, h, 1)
end
w_list.each do |w|
  flow.add_edge(w, goal, 1)
end

N.times do |i|
  a, b, c, d = gets.split.map(&:to_i)
  koma = koma_list[i]
  koma2 = koma_list2[i]
  flow.add_edge(koma, koma2, 1)
  a.upto(c) do |h|
    flow.add_edge(h_list[h-1], koma, 1)
  end
  b.upto(d) do |w|
    flow.add_edge(koma2, w_list[w-1], 1)
  end
end

puts flow.flow(start, goal, N)