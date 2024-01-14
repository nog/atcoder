T = gets.to_i


def calc n, s
  # warn "n:#{n}"
  if n == 2
    return s[-1]
  end
  bcount = s.count('B')
  if bcount == 0
    return "A"
  end
  bcount.times do |i|
    if s[-1-i] != "B"
      return "A"
    end
  end
  return "B"
  # if n > 5
  #   if s[1..-1].include?("A")
  #     return "A"
  #   else
  #     return "B"
  #   end
  # end

  # if s[-2] == "B" && s[-1] == "A"
  #   return "A"
  # end
  a = []
  b = []
  (n-1).times do |i|
    if s[i] == "A"
      a.push(i)
    else
      b.push(i)
    end
  end
  if a.size == 0 && s[-1] == "B"
    return "B"
  end
  if b.size == 0 && s[-1] == "A"
    return "A"
  end
  ns = []
  a.each do |i|
    ns.push(s[i+1])
  end
  b.each do |i|
    ns.push(s[i+1])
  end
  # warn ns.inspect
  calc(n-1, ns)
end

# list = ["A", "B"]
# list.repeated_permutation(10) do |x|
#   r = calc(10, x)
#   if r == "B"
#     warn x.inspect
#   end
# end

T.times do
  n = gets.to_i
  s = gets.chomp.split('')
  # warn "---"
  # warn s.inspect
  puts calc(n,s)
end