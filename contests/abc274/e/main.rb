N, M = gets.split.map(&:to_i)
NM = N+M
towns = []
N.times do |i|
  towns.push gets.split.map(&:to_i)
end

takaras = []
M.times do |i|
  takaras.push gets.split.map(&:to_i)
end

points = towns + takaras

dis= Array.new(points.size){ Array.new points.size }
disgen = Array.new(points.size)
points.size.times do |i|
  fx, fy = points[i]
  disgen[i] = ((fx ** 2) + (fy ** 2))**0.5
  points.size.times do |j|
    if i == j
      dis[i][j] = 0
    else
      tx, ty = points[j]
      dis[i][j] = ((fx - tx).pow(2) + (fy - ty).pow(2)) ** (0.5)
    end
  end
end

dp = Array.new(NM){ Hash.new }

# warn dp.inspect
(2**(NM)).times do |stat|

  dones = []
  nexts = []
  spd = 1
  NM.times do |poi|
    if stat[poi] == 1
      dones.push(poi)
      spd *= 2 if poi >= N
    else
      nexts.push(poi)
    end
  end
  if dones.size == 0
    nexts.each do |ne|
      nstat = 2**ne
      dp[ne][nstat] = disgen[ne]
    end
    next
  end

  nexts.each do |ne|
    dpne = dp[ne]
    disne = dis[ne]
    nstat = stat + 2**ne
    dones.each do |last|
      ltime = dp[last][stat]
      r = ltime + (disne[last]/ spd)
      dpne[nstat] = r if !dpne[nstat] || r < dpne[nstat]
    end
  end
end

dstat = 0
N.times do |i|
  dstat += 2**i
end

result = 10**20
[true, false].repeated_permutation(M).each do |arr|
  spd = 1
  stat = dstat
  M.times do |i|
    if arr[i]
      spd *= 2
      stat += 2**(i+N)
    end
  end
  N.times do |last|
    next if stat[last] == 0
    r = dp[last][stat] + (disgen[last] / spd)
    result = r if r < result
  end
end

puts result