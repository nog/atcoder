ARG_N = gets.to_i
ARG_P = gets.split.map(&:to_i)
ARG_Q = gets.split.map(&:to_i)

deta = []
p_list = ARG_P.map do |x|
  r = x - deta.find_all{|k| k < x }.count
  deta.push(x)
  r
end
deta = []
q_list = ARG_Q.map do |x|
  r = x - deta.find_all{|k| k < x }.count
  deta.push(x)
  r
end
result = 0

def kaijo x
  result = 1
  while(x > 1) do
    result *= x
    x -= 1
  end
  result
end

ARG_N.times do |i|
  result += (p_list[i] - q_list[i]) * kaijo(ARG_N-(i+1))
end
puts result.abs