N = gets.to_i
@routes = {}
(N-1).times do
  u, v = gets.split.map(&:to_i)
  @routes[u] ||= []
  @routes[v] ||= []
  @routes[u].push(v)
  @routes[v].push(u)
end

@max = 0
@result = Array.new N
# warn @routes.inspect
def tansaku po, pa
  childs = @routes[po].find_all do |ch|
    ch != pa
  end
  # warn "po:#{po} pa:#{pa}"
  # warn childs.inspect
  if childs.size == 0
    @max += 1
    return(@result[po-1] = [@max, @max])
  else
    min = N+1
    max = 0
    childs.each do |ch|
      mi, ma = tansaku(ch, po)
      if mi < min
        min = mi
      end
      if ma > max
        max = ma
      end
    end
    return(@result[po-1] = [min, max])
  end
end

tansaku 1, 0
# warn @result.inspect
@result.each do |r|
  puts r.join(' ')
end