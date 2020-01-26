ARG_N = gets.to_i

result = 0
1.upto(ARG_N) do |i|
  if i < 10
    result += 1
    next
  end
  if i % 10 == 0
    next
  end
  s = i.to_s
  first , last = s[0], s[-1]
  keta = Math.log10(i).to_i + 1
  if (keta - 3) > 1
    result += 10**(keta-3)
  end
  if first > last
    result += 10**(keta-2)
  end
  if first == last
    result += 1
  end
end
puts result