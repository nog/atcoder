S = gets.chomp.split('')
K = gets.to_i

len = S.length
list = [0]
result = 0
len.times do |i|
  if S[i] == '.'
    list.push(i+1)
    if list.size > K+1
      list.shift
    end
  end
  r = i+1 - list[0]
  if r > result
    result = r
  end
end
puts result