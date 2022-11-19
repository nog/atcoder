N = gets.to_i
A = Array.new N
N.times do |i|
  A[i] = gets.split('')
end

results = Array.new(N){ Array.new(N) }

def incorrect
  puts "incorrect"
  exit
end
N.times do |i|
  N.times do |j|
    next if i == j
    a = A[i][j]
    if a == "D"
      incorrect if A[j][i] != "D"
    elsif a == "W"
      incorrect if A[j][i] != "L"
    elsif a == "L"
      incorrect if A[j][i] != "W"
    else
      raise
    end
  end
end

puts "correct"