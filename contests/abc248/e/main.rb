N, K = gets.split.map(&:to_i)
XY = Array.new N
XK = {}
YK = {}
N.times do |i|
  x, y = gets.split.map(&:to_i)
  XK[x] ||= {}
  XK[x][y] = true
  YK[y] ||= {}
  YK[y][x] = true
end

if K == 1
  puts 'Infinity'
  exit
end
result = 0
XK.each do |x, yl|
  if yl.size >= K
    result += 1
  end
end

# YK.each do |y, xl|
#   if xl.size >= K
#     result += 1
#   end
# end

xkeys = XK.keys.sort!

while(x = xkeys.shift) do
  # warn "x:#{x}"
  XK[x].each do |y, _|
    counts = {}
    # warn "y:#{y}"
    xkeys.each do |tx|
      XK[tx].each do |ty, _|
        kata = Rational(ty - y, tx - x)
        # warn "x:#{x} y:#{y} tx:#{tx} ty:#{ty} kata:#{kata}"
        counts[kata] ||= 1
        counts[kata] += 1
      end
    end
    # warn counts.inspect
    counts.each do |k, v|
      if v == K
        result += 1
      end
    end
  end
end

puts result