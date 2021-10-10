N = gets.to_i 

routes = {}
N.times do 
  u, v, w = gets.split.map(&:to_i)
  routes[u] ||= {}
  routes[u][v] = w
  routes[v] ||= {}
  routes[v][u] = w
end

@result = 0
@counts = Array.new(N+1, 1)
@max = Array.new(N+1)
routes[-1] = {
  1 => 0
}

def dfs cur, par
  routes[cur].delete(par)
  list = routes[cur].keys
  
  list.each do |ne|
    dfs ne, cur
  end

  @result = routes[par][cur] * @counts[cur] * N
  @counts[par] += 1
end