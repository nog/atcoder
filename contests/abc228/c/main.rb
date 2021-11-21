N, K = gets.split.map(&:to_i)
P = Array.new N
N.times do |i|
  P[i] = gets.split.map(&:to_i)
end

sums = P.map{|x| x.sum }.sort!.reverse
line = sums[K-1] - 300

N.times do |i|
  sum = P[i].sum
  if sum >= line
    puts 'Yes'
  else
    puts 'No'
  end
end