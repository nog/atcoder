T = gets.to_i

T.times do |i|
  a,b,c = gets.split.map(&:to_i).sort
  results = []
  if (c - a) % 3 == 0
    _a, _b, _c = a, b, c
    x = (c - a) / 3
    if b >= x
      results.push(c)
    elsif a >= (x - b
    end
  end

  if (c - b) % 3 == 0
    results.push(b)
  end

  if (b - a) % 3 == 0
    results.push(b)
  end

  if results.size > 0
    puts results.min
  else
    puts -1
  end

end