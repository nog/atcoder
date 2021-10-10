N = gets.to_i
A = gets.split.map(&:to_i)

@routes = {}
(N-1).times do
  u, v = gets.split.map(&:to_i)
  @routes[u] ||= []
  @routes[u].push(v)
  @routes[v] ||= []
  @routes[v].push(u)
end

def calc taro, current, gones
  gones[current] = true
  list = @routes[current].find_all{|x| !gones[x] }
  if list.size > 0
    results = list.map{|x| calc(!taro, x, gones.etup)}
    taro ? results.max : results.min
  else
    list = gones.keys.map{|x| A[x-1]}.sort
    size = list.size
    if size.odd?
      return list[size/2]
    else
      return (list[(size/2)-1] + list[size/2]) / 2
    end
  end
end

puts calc(true, 1, {})