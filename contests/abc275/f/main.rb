N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

dp = Array.new(N+1)
dp[0] = Array.new(3001)
dp[0][0] = [Float::INFINITY, 0]

def min a, b
  (a < b) ? a : b
end

N.times do |i|
  bd = dp[i]
  a = A[i]
  nd = Array.new(3001)
  bd.each.with_index do |b, j|
    next unless b
    if b[0] < N
      nd[j] ||= [Float::INFINITY, Float::INFINITY]
      nd[j][0] = min(nd[i][0] || Float::INFINITY, b[0] )

      if j + a <= 3000
        nd[j+a] ||= [Float::INFINITY, Float::INFINITY]
        nd[j+a][1] = min(nd[j+a][1] || Float::INFINITY, nd[i][0] )
        nd[j+a][1] = min(nd[j+a][1] || Float::INFINITY, nd[i][0] )
      end
    end

    if b[1] < N
      nd[j] ||= [Float::Infinity, Float::INFINITY]
      nd[j][0] = min(nd[j][0], b[1] + 1)
    end
  end
end