N, X, Y = gets.split.map(&:to_i)

@routes = Array.new(N+1)
(N-1).times do |i|
  u, v = gets.split.map(&:to_i)
  @routes[u] ||= []
  @routes[u].push(v)
  @routes[v] ||= []
  @routes[v].push(u)
end


result = []
cur = X

def calc cur, result, parent
  @routes[cur].each do |to|
    next if to == parent
    result.push(cur)
    if to == Y
      result.push(Y)
      puts result.join(' ')
      exit
    end
    calc to, result, cur
    result.pop
  end
end

calc(cur, result, 0)