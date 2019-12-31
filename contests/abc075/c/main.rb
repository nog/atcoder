N, M = gets.split(' ').map(&:to_i)
require 'pp'
def debug obj
  PP.pp obj, STDERR
end

debug [N,M]
@nodes = {} # key node番号, value keyのnodeから生えてるedgeの向き先配列
@result = 0
@visits = {}
@ords = []
@lows = []
@step = 0

M.times do
  a, b = gets.split(' ').map(&:to_i)
  @nodes[a] ||= []
  @nodes[b] ||= []
  @nodes[a].push(b)
  @nodes[b].push(a) 
end

def dfs node,parent=-1
debug @lows
  @visits[node] = true
  @ords[node] = @step
  @lows[node] = @step
  @nodes[node].each do |target|
    if target == parent
      next
    end
    if @visits[target]
      if @ords[target] < @lows[node]
        @lows[node] = @ords[target]
      end
    else
      @step += 1
      dfs(target, node)
      if @lows[target] < @lows[node]
        @lows[node] = @lows[target]
      end
      if @ords[node] < @lows[target]
        @result += 1
      end
    end
  end
end

dfs(1)
debug @nodes
debug @ords
debug @lows
puts @result