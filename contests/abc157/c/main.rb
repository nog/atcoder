N, M = gets.split.map(&:to_i)
S, C = [], []
M.times do |i|
  S[i], C[i] = gets.split.map(&:to_i)
end

result = Array.new N 

M.times do |i|
  s = S[i] - 1
  c = C[i]

  if result[s] && result[s] != c 
    puts -1
    exit
  end
  result[s] = c
end

str = ""
result.each_with_index do |r, i|
  if r 
    str += r.to_s
  else
    if i == 0 && result.length > 1
      str += "1"
    else
      str += "0"
    end
  end
end

if str[0] == "0" && str.length > 1
  puts -1
else
  puts str
end