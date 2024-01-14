N, M = gets.split.map(&:to_i)
C = Array.new(N)
A = Array.new(N)
ahash = []
M.times do |i|
  C[i] = gets.to_i
  A[i] = gets.split.map(&:to_i)
  ah = {}
  A[i].each do |a|
    ah[a] = true
  end
  ahash[i] = ah
end

result = 0

1.upto(M) do |i|
  ahash.combination(i).each do |l|
    h = {}
    l.each do |a|
      h.merge!(a)
    end
    if h.size == N
      result += 1
    end
  end
end

puts result