T = gets.to_i
T.times do
  x = gets.split.map(&:to_i)
  if x[0] == x[1] && x[1] == x[2]
    puts 0
    next
  end

  if (x[1] - x[0]).odd? || (x[2] - x[0]).odd?
    puts -1
    next
  end
  count = 0

  x.sort!
  while(x[0] != x[2]) do
    d0 = x[1] - x[0]
    d1 = x[2] - x[1]
    c = nil
    if d0 == 0
      if d1 % 6 == 0
        count += (d1 / 6) * 2
        break
      else
        count = -1
        break
      end
    end
    if d1 == 0
      if d0 % 6 == 0
        count += (d0 / 6) * 2
        break
      else
        count = -1
        break
      end
    end
    if d1 > d0
      c = d0 / 2
    else
      c = d1 / 2
    end
    count += c
    x[0] += c * 4
    x[1] += c * 2
    x.sort!
    # warn "c:#{c} x:#{x.inspect}"
  end
  puts count
end