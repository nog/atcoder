S = gets.chomp
len = S.length
result = 0
counts = {}
counts[S[-1]] = 1
counts[S[-2]] ||= 0
counts[S[-2]] += 1

(len - 3).downto(0) do |i|
    s = S[i]
    if s == S[i+1] && s != [i+2]
        result += len - i - 1 - counts[s]
        counts = {
            s => len - i
        }
    else
        counts[s] ||= 0
        counts[s] += 1
    end
end

puts result