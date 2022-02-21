X = gets.to_i
xlist = X.to_s.split('').map(&:to_i)
xsize = xlist.size
kouho = []
x0 = xlist[0]
0.upto(9) do |_d|
  [_d, - _d].each do |d|
    [x0, x0+1].each do |x|
      next if x > 9
      k = [x]
      (xsize - 1).times do |i|
        a = x + d * (i+1)
        break if a > 9
        break if a < 0
        k.push(a)
      end
      if k.size == xsize
        kou = k.join('').to_i
        kouho.push(kou) if  X <= kou
      end
    end
  end
end
puts kouho.min