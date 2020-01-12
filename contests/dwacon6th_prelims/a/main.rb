ARG_N = gets.to_i
ARG_s = Array.new ARG_N
ARG_t = Array.new ARG_N
ARG_N.times do |i|
  ARG_s[i], t = gets.split
  ARG_t[i] = t.to_i
end
ARG_X = gets.chop

result = 0
a = ARG_s.find_index ARG_X
s = a+1
while(s < ARG_N) do
  result += ARG_t[s]
  s+=1
end

puts result