T = gets.to_i
T.times do 
  n, m = gets.split.map(&:to_i)
  xy = Array.new n
  n.times do |i|
    xy[i] = gets.split.map(&:to_i)
  end
  f = xy[0]
  result = f[0]
  bi = f[1]
  bc = f[0]
  bb = bc * bi
  ba = bc * (bi + 1) * bi / 2
  result = ba if ba > result
  1.upto(n-1) do |i|
    x, y = xy[i]
    i = bi + y
    c = x
    b = bb + (c * y)
    a = ba + (bb + c + b) * y / 2
    # warn b
    if bb > 0 && b < 0
      # warn "AA"
      my = - (bb / c) - 1
      mb = bb  + (c * my)
      ma = ba + (bb + c + mb) * my / 2
      # warn "my :#{my}"
      # warn "mb :#{mb}"
      # warn "ma :#{ma}"
      result =ma if ma > result
    else
      result = a if a > result
    end

    bi = i
    bc = c
    bb = b
    ba = a
  end
  puts result
end