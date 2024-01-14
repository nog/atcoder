N = gets.to_i 
A = gets.split.map(&:to_i)
S = Array.new N 

costs = Array.new(N){ Array.new(N)}
points = Array.new(N){ Array.new(N) }
N.times do |i|
  s = gets.chomp.split('').map.with_index{|x, j| x == 'Y' ? j : nil }.compact
  S[i] = s
  a = A[i]
  s.each do |to|
    costs[i][to] = 1
    points[i][to] = a
  end
end
N.times do |k|
  costsk = costs[k]
  pointsk = points[k]
  N.times do |i|
    costsi = costs[i]
    pointsi = points[i]
    next unless costsi[k]
    N.times do |j|
      next unless costsk[j]
      if costsi[j]
        cc = costsi[j]
        nc = costsi[k] + costsk[j]
        next if cc < nc
        if nc < cc
          costsi[j] = nc 
          pointsi[j] = pointsi[k] + pointsk[j]
        else
          pointsi[j] = [pointsi[j], pointsi[k] + pointsk[j]].max
        end
      else
        costs[i][j] = costsi[k] + costsk[j]
        points[i][j] = pointsi[k] + pointsk[j]
      end
    end
  end
end

# warn S.inspect 
Q = gets.to_i
Q.times do 
  u, v = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  if costs[u][v]
    puts "#{costs[u][v]} #{points[u][v] + A[v]}"
  else
    puts 'Impossible'
  end
end