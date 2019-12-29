N = gets.chomp.to_i
@map = {}
(N-1).times do
  a, b= gets.chomp.split(' ').map(&:to_i)
  @map[a] ||= []
  @map[b] ||= []
  @map[a].push(b)
  @map[b].push(a)
end

@tree = {}
def ctree parent, current
  @tree[current] = @map[current] - [parent]

  @tree[current].each do |i|
    ctree current, i
  end
end
ctree 0,1

@dis = { 1 => 0}
def cdis current
  d = @dis[current]
  @tree[current].each do |c|
    @dis[c] = d + 1
    cdis c
  end
end
cdis 1

hopes = {}
def calchope node
  if tree[node].size == 0
    return 0
  end
end

pp @map
pp @tree
pp @dis