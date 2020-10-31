N, M = gets.split.map(&:to_i)

result = Array.new(N)

(N-1).times do |i|
    result.push([i*100000 + 100, i*100000 + 200])
end

if M == 0
    result.push([1,2])