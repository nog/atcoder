S = gets.chomp.split('')
T = gets.chomp.split('')

result = T.length
len = T.length

0.upto(S.length - len) do |d|
    res = 0
    len.times do |i|
        if T[i] != S[d+i]
            res +=1
        end
        if res >= result
            break
        end
    end
    if res < result
        result = res
    end
end

puts result