N, M = gets.split.map(&:to_i)
ABC = Array.new M
routes = {}
@distances = Array.new(N){ Array.new(N, Float::INFINITY)}

def dis a, b
  @distances[a][b]
end

def setdis a, b, c
  @distances[a][b] = c
  @distances[b][a] = c
end
M.times do |i|
  a,b,c = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  setdis(a,b,c)
  ABC[i] = [a,b,c]
end
 
N.times do |k|
  dk = @distances[k]
  N.times do |i|
    di = @distances[i]
    dik = dk[i]
    next if dik == Float::INFINITY
    N.times do |j|
      djk = dk[j]
      next if djk == Float::INFINITY
      d = di[j]
      dikdjk = dik + djk
      if dikdjk < d
        setdis(i,j, dikdjk)
      end
    end
  end
end
 
result = 0
ABC.each do |a,b,c|
  count = false
  da = @distances[a]
  db = @distances[b]
  N.times do |i|
    if da[i] + db[i] <= c
      count = true
    end
  end
  result += 1 if count
end
 
puts result