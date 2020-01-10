ARG_N, ARG_W = gets.split.map(&:to_i)
ARG_w = Array.new(ARG_N)
ARG_v = Array.new(ARG_N)
ARG_N.times do |i|
  ARG_w[i], ARG_v[i] = gets.split.map(&:to_i)
end

def max a,b
  a > b ? a : b
end

def min a,b
  a > b ? b : a
end

MAX_V = ARG_N*(10**3)
dp = Hash.new(Float::INFINITY)
dp[0] = 0
ARG_N.times do |i|
  w, v = ARG_w[i], ARG_v[i]
  dv = MAX_V
  while v <= dv do
    dw = dp[dv-v]+w
    if dw <= ARG_W
      dp[dv] = min(dw, dp[dv])
    end
    dv-=1
  end
end
puts dp.keys.max