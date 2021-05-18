N = gets.to_i
S = gets.chomp.split('').map(&:to_i)
T = gets.chomp.split('').map(&:to_i)

if S.count(0) != T.count(0)
    puts -1
    exit
end

if S == T
    puts 0
    exit
end

s = S.dup
t = T.dup

result = 0

while s.length > 0 do
    while(s[0] && s[0] == t[0]) do
        s.shift
        t.shift
    end

    while(s[0] && s[-1] == t[-1]) do
        s.pop
        t.pop
    end

    break unless s[0]
    
    warn s.join('')
    warn t.join('')

    if s[0] == 0
        x = s.find_index(1)
        s[x] = 0
        s[0] = 1
        result += x
    else
        x = s.find_index(0)
        s[x] = 1
        s[0] = 0
        result += 1
    end
    if s[-1] != t[-1]
        if s[-1] == 0
            x = s.reverse.find_index(1)
            s[-x-1] = 0
            s[-1] = 1
            result += x
        else
            x = s.reverse.find_index(0)
            s[-x-1] = 1
            s[-1] =0
            result += 1
        end
    end
end

puts result