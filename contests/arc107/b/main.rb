N, K = gets.split.map(&:to_i)

sumpat = [0,0]
2.upto(2 * N) do |i|
    if i <= N + 1
        sumpat[i] = i - 1
    else
        sumpat[i] = 2 * N - i + 1
    end
end

result = 0

2.upto(2 * N) do |i|
    next if ( i - K ) < 2
    next if ( i - K ) > 2 * N
    result += sumpat[i] * sumpat[i-K]
end

puts result