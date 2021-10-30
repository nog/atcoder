N, M = gets.split.map(&:to_i)

@lhash = {}
@rhash = {}
M.times do
  a, b = gets.split.map(&:to_i)
  if @lhash[a]
    @lhash[a].push(b)
  else
    @lhash[a] = [b]
  end

  if @rhash[b]
    @rhash[b].push(a)
  else
    @rhash[b] = [a]
  end
end
@result = []
@kisyu = {}

def addres i
  return if @kisyu[i]
  ok = (@rhash[i] || [] ).all? do |x|
    if x < @cur
      addres(x)
    end
    @kisyu[x]
  end
  unless ok
    return
  end
  @result.push(i)
  @kisyu[i] = true
  (@lhash[i] || []).sort.each do |l|
    next if @kisyu[l]
    break if l > i
    addres l
  end
end
2.times do
  1.upto(N) do |i|
    @cur = i
    addres(i)
  end
end
# warn @result.inspect
if @result.size == N
  puts @result.join(' ')
else
  puts -1
end