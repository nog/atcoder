N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

ans1 = 0
ans2 = 0

hist = {}

N.times do |i|
  a, b = A[i], B[i]
  if a == b
    ans1 += 1
  else
    if hist[a]
      ans2 += 1
    end
    if hist[b]
      ans2 += 1
    end
    hist[a] = true
    hist[b] = true
  end
end

puts ans1, ans2