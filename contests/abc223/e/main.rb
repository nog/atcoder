X, Y , A, B, C = gets.split.map(&:to_i)

[[A,B,C], [A,C,B], [B,A,C], [B,C,A],[C,A,B],[C,B,A]].each do |a,b,c|
  [[X,Y], [Y,X]].each do |x,y|
    ay = (a.to_f / x).ceil
    _y2 = y - ay
    _x2 = x
    [[_x2, _y2], [_y2, _x2]].each do |x2, y2|
      if x2 <= 0
        next
      end

      by = (b.to_f / x2).ceil
      y3 = y2 - by
      next if y3 < 0
      x3 = x2
      if x3 * y3 >= c
        # warn "a:#{a} b:#{b} c:#{c}"
        # warn "x: #{x} y:#{y}"
        # warn "x2: #{x2} y2:#{y2}"
        # warn "x3: #{x3} y3:#{y3}"
        puts 'Yes'
        exit
      end
    end
  end
end

puts 'No'
exit