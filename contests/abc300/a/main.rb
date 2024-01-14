N, A, B = gets.split.map(&:to_i)

r = A + B
C = gets.split.map(&:to_i)

N.times do |i|
  if C[i] == r
    puts i+1
    exit
  end
end