N = gets.to_i 
S = gets.split.map(&:to_i)
T = gets.split.map(&:to_i)

result = T.dup
2.times do
  N.times do |i|
    x = result[i-1] + S[i-1]
    if result[i] >= x
      result[i] = x
    end
  end 
end

N.times do |i|
  puts result[i]
end