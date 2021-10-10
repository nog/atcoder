T = gets.to_i

def use_n6 n2, n4, n6
end

T.times do
  n2, n3, n4 = gets.split.map(&:to_i)
  # 2,2,2,2,2
  # 2,2,2,4
  # 2,2,3,3
  # 2,4,4
  # 3,3,4

  # 2,2,2,2,2
  # 2,2,2,4
  # 2,2,6
  # 2,4,4
  # 4,6
  n6 = n3 / 2
  result = 0
  if n6 >= n4
    result += n4
    n6 -= n4
    n4 = 0
  else
    result += n6
    n4 -= n6
    n6 = 0
  end

  if n6 > 0 && n2 >= 2
    if n6 > n2 / 2
      result += n2 / 2
      n6 -= n2 / 2
      n2 = n2.odd? ? 1 : 0
    else
      result += n6
      n2 -= n6 * 2
      n6 = 0
    end
  end

  if n4 >= 2
    if n4 > 2 * n2
      result += n2
      n4 -= 2 * n2
      n2 = 0
    else
      result += n4 / 2
      n2 -= n4 / 2
      n4 = n4.odd? ? 1 : 0
    end
  end

  if n4 > 0
    if n4 > n2 / 3
      result += n2 / 3
      n4 -= n2 / 3
      n2 %= 3
    else
      result += n4
      n2 -= n4 * 3
      n4 = 0
    end
  end

  result += n2 / 5
  puts result
end