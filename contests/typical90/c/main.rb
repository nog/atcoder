N = gets.to_i
AB = Array.new N
@tree = Array.new N+1
(N-1).times do |i|
  a, b = gets.split.map(&:to_i)
  @tree[a] ||= []
  @tree[b] ||= []
  @tree[a].push(b)
  @tree[b].push(a)
end

@longest_length = 0
@longest_point  = nil

def search point, parent, len
  childs = @tree[point].reject{|i| i == parent }
  return if childs.size == 0
  nlen = len+1
  if nlen > @longest_length 
    @longest_length = nlen
    @longest_point = childs[0]
  end
  childs.each do |c|
    search c, point, nlen
  end
end

search 1, 0, 0
dpoint = @longest_point
@longest_point =nil
@longest_length = 0

search dpoint, 0, 0
puts @longest_length + 1