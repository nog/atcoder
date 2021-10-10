N = gets.to_i
X, Y = gets.split.map(&:to_i)
A = Array.new N
B = Array.new N
N.times do |i|
  A[i], B[i] = gets.split.map(&:to_i)
end

asum = A.sum
bsum = B.sum

if asum < X
  puts -1
  exit
end

if bsum < Y
  puts -1
  exit
end
amax = asum - X 
bmax = bsum - Y

dp = []
dp[0] = {}
dp[0][0] = 0

N.times do |i|
  a, b = A[i], B[i]
  next if a > amax
  next if b > bmax
  (dp.size - 1).downto(0) do |cnt|
    dpcnt = dp[cnt]
    dpncnt = dp[cnt+1] || {}
    xlist = dpcnt.keys.sort.reverse
    xlist.each do |x|
      y = dpcnt[x]
      xa = x + a
      next if xa > amax
      yb = y + b
      next if yb > bmax
      cur = dpncnt[xa] 
      if !cur || cur > yb
        dpncnt[xa] = yb
      end
    end
    if(dpncnt.keys.size > 0)
      dp[cnt+1] = dpncnt
    end
  end
end


puts N - (dp.size - 1)