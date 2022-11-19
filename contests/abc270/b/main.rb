X, Y, Z = gets.split.map(&:to_i)

if 0 < X
  if Y < 0
    puts X
    exit
  end

  if X < Y
    puts X
    exit
  end

  if Y < Z
    puts -1
    exit
  end

  puts (Z.abs) + (X - Z)
else
  if 0 < Y
    puts X.abs
    exit
  end

  if Y < X
    puts X.abs
    exit
  end

  if Y > Z
    puts -1
    exit
  end

  puts (Z.abs) + (X - Z).abs
end