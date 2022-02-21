N = gets.to_i
P = gets.split.map(&:to_i)
M = gets.to_i
@routes = Array.new(N+1){ Hash.new }
M.times do |i|
  a, b = gets.split.map(&:to_i)
  @routes[a][b] = i
  @routes[b][a] = i
end

@treen = Array.new N+1

def dfs i, pa
  list = routes[i].keys
  list.each do |j|
    next if @treen[j]
    @treen[j] = pa
    dfs j, pa
  end
end
roots = []
1.upto(N) do |i|
  next if @treen[i]
  @treen[i] = i
  dfs i, i
  roots.push(i)
end