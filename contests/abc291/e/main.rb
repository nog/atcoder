N, M = gets.split.map(&:to_i)

@to = Array.new(N){ Array.new }
@from = Array.new(N){ Hash.new }

M.times do |i|
  x, y = gets.split.map(&:to_i)
  x -= 1
  y -= 1
  @to[x].push(y)
  @from[y][x] = true
end

list = []
glist = []
N.times do |i|
  if @from[i].size == 0
    list.push(i)
  end
  if @to[i].size == 0
    glist.push(i)
  end
end

if list.size != 1
  puts "No"
  exit
end

if glist.size != 1
  puts "No"
  exit
end

start = list[0]
@goal = glist[0]

@max = 0


def calc cur, l
  if @to[cur].size == 0
    if l.size == N && cur == @goal
      puts "Yes"
      result = Array.new(N)
      l.each.with_index do |x, i|
        result[x] = i+1
      end
      puts result.join(' ')
      exit
    end
    return
  end
  @to[cur].each do |ne|
    @from[ne].delete(cur)
    next if @from[ne].size != 0
    l.push(ne)
    calc ne, l
    l.pop
  end
end

calc start, [start]
puts "No"