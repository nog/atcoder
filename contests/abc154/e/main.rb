N = gets.to_i
K = gets.to_i
keta = N.to_s.length
first = N.to_s[0].to_i
result = 0

nums_list = (1..9).to_a.repeated_permutation(K-1).to_a
(0..(keta-1)).to_a.combination(K) do |arr|
  if arr[-1] < keta-1
    result += 9**K
    next
  end
  result += (first - 1) * (9**(K-1))
  base = first * (10**arr[-1])
  nums_list.each do |nums|
    x = base
    nums.each_with_index do |nn, index|
      x += nn * (10**arr[index])
    end
    if x <= N 
      result += 1
    end
  end
end
puts result