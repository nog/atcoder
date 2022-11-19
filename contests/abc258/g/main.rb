N = gets.to_i
A = Array.new N
N.times do |i|
  A[i] = gets.to_i(2)
end

result = 0
(N-2).times do |i|
  ai = A[i]
  (i+1).upto(N-2) do |j|
    next if ai[j] == 0
    aj = A[j]
    warn "i:#{i} j:#{j} str:#{(ai & aj).to_s(2)}"
    result += (ai & aj).to_s(2).count('1')
  end
end

puts result / 2