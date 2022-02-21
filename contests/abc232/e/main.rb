H, W, K = gets.split.map(&:to_i)
x1, y1, x2, y2 = gets.split.map(&:to_i)
MOD = 998244353

start = 1
start_h = 0
start_w = 0
other = 0

K.times do
  ns = start_h * (W - 1) + start_w * (H-1)
  nsh = other * (H-1) + start + start_h * (W-2)
  nsw = other * (W-1) + start + start_w * (H-2)
  no = start_h + start_w + other * (H-2+W-2)

  start = ns % MOD
  start_h = nsh % MOD
  start_w = nsw % MOD
  other = no % MOD
end

if x1 == x2 && y1 == y2
  puts start
elsif x1 == x2
  puts start_h
elsif y1 == y2
  puts start_w
else
  puts other
end

