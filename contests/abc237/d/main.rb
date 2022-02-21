
N = gets.to_i
S = gets.chomp.split('')

left = []
right = []
N.times do |i|
  if S[i] == "L"
    right.unshift(i)
  else
    left.push(i)
  end
end

puts (left + [N] + right).join(' ')