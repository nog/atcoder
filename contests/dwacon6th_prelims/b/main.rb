ARG_N = gets.to_i
ARG_x = gets.split.map(&:to_i)
MOD = 10**9+7
MAX_N = 10**5
kaijo = Array.new(MAX_N+1)
kaijo[0] = 1
i=1
while(i<= ARG_N) do
  kaijo[i] = i * kaijo[i-1]
  i+=1
end

kakuritu = Array.new(ARG_N-1)
kakuritu[0] = 1
j = 1
  p kakuritu
while(j<ARG_N-1) do
  kakuritu[j] = (kakuritu[j-1] + (1.to_f/(j+1)))
  j+=1
end

sum = 0
i = 0
while(i<ARG_N-1) do
  sum = (sum + (ARG_x[i+1]-ARG_x[i]) * (kakuritu[i]*kaijo[ARG_N-1] ))% MOD
  i+=1
end

puts sum.to_i