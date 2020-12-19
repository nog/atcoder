N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort

diffs = Array.new M + 1

current = 0
k = N
M.times do |i|
    a = A[i]
    diff = a - current - 1
    if diff > 0 && diff < k
        k = diff
    end
    diffs[i] = diff
    current = a
end
diffs[-1] = N - current


result = 0
diffs.each do |diff|
    next if diff == 0 || diff.nil?
    result += (diff.to_f / k ).ceil
end

# warn A.inspect
# warn diffs.inspect
# warn "k:#{k}"

puts result