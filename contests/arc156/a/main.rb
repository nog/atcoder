T = gets.to_i
T.times do
  n = gets.to_i
  s = gets.split('').map(&:to_i)
  cnt = s.count(1)
  if cnt == 0
    puts 0
    next
  end
  if cnt.odd?
    puts -1
    next
  end

  if n == 3
    if s[1] == 1
      puts -1
      next
    end
  end

  if cnt != 2
    puts cnt / 2
    next
  end

  if n == 4
    if s[1] == 1 && s[2] == 1
      puts 3
      next
    end
  end

  i = s.find_index(1)
  if s[i+1] == 1
    puts 2
  else
    puts 1
  end
end