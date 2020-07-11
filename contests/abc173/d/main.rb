N = gets.to_i
A = gets.split.map(&:to_i).sort.reverse
result = A.shift
n = N - 2
warn result.inspect
if n == 0
    puts result
    exit
end

a = A.shift
cnt = 0
while n > 0 do
    if cnt < 2
        result += a
        cnt += 1
    else
        a = A.shift
        result += a
        cnt = 1
    end
    n -= 1
end

puts result