N = gets.to_i

s1 = 1
s5 = 0
s7 = 0

s3 = 0
s4 = 0
s8 = 0

n = N - 1

while(n > 0) do
  if s8 < 9
    d = 9 - s8
    if n <= d 
      d = n 
    end
    s8 += d
    n -= d
    next
  end
  if s7 < 9
    n -= 1
    s7 += 1
    s8 = 0
    next 
  end
  if s5 < 9
    n -= 1
    s5 += 1
    s7 = 0
    s8 = 0
    next
  end
  if s4 < 9
    n -= 1
    s4 += 1
    s5 = 0
    s7 = 0
    s8 = 0
    next 
  end
  if s3 < 9
    n -= 1
    s3 += 1
    s4 = 0
    s5 = 0
    s7 = 0
    s8 = 0
    next 
  end

  n -= 1
  s1 += 1
  s3 = 0
  s4 = 0
  s5 = 0
  s7 = 0
  s8 = 0
end

puts [s1,s1, s3, s4, s5, s5, s7, s8, s7].join('').to_i