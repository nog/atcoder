ARG_N = gets.to_i
ARG_A = Array.new(ARG_N)
ARG_B = Array.new(ARG_N)
ARG_C = Array.new(ARG_N)
ARG_N.times do |i|
  ARG_A[i], ARG_B[i], ARG_C[i] = gets.split.map(&:to_i)
end

def max a,b
  a > b ? a : b
end

prev = [0,0,0]
n = 0
while(n<ARG_N) do
  prev = [
    ARG_A[n] + max(prev[1], prev[2]),
    ARG_B[n] + max(prev[0], prev[2]),
    ARG_C[n] + max(prev[0], prev[1])
  ]
  n+=1
end

puts prev.max