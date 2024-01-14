# 入力を受け取る
n, m = gets.split.map(&:to_i)
N = n 

# グラフを表すハッシュを初期化する
@graph = Array.new(N+1){ Array.new }
m.times do
  u, v = gets.split.map(&:to_i)
  @graph[u].push v
  @graph[v].push u
end

@types = Array.new N + 1
@types[1] = true
queue = [[1, true, 0]]


while(q = queue.shift) do
  node, type, parent = q
  nt = !type
  @graph[node].each do |nnode|
    next if parent == nnode
    if @types[nnode] != nil
      if @types[nnode] == type
        puts 0
        exit 
      else
        next
      end
    end
    @types[nnode] = nt
    queue.push([nnode, nt, node])
  end
end
tcount = @types.count(true)
fcount = @types.count(false)
puts (tcount * fcount) - m