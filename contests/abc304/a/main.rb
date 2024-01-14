N = gets.to_i
SA = []
N.times do
  SA.push gets.split
end

min = 10**10
mini = N

N.times do |i|
  if SA[i][1].to_i < min
    min = SA[i][1].to_i
    mini = i
  end
end

N.times do |i|
  puts SA[(i+mini)%N][0]
end