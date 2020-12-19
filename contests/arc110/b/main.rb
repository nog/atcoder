N = gets.to_i
S = gets.chomp

CNT = 10**10

if N == 1
    if S == "1"
        puts (10**10) * 2
        exit
    end

    if S == "0"
        puts (10**10)
        exit
    end
end

if N == 2
    if S == "10"
        puts (10**10)
        exit
    end
    if S == "01"
        puts (10**10) - 1
        exit
    end
    if S == "11"
        puts (10**10)
        exit
    end

    puts 0
    exit
end

a = nil
b = nil
if S[0] == "0"
    a = 2
    b = 2
elsif S[0] == "1" && S[1] == "1"
    a = 0
    b = 0
elsif S[0] == "1" && S[1] == "0"
    a = 1
    b = 1
else
    puts 0
    exit
end

list = ["1", "1", "0"]

N.times do |i|
    if S[i] != list[a]
        puts 0
        exit
    end
    a = (a + 1) % 3
end



result = CNT - ((b+N).to_f / 3).ceil + 1

puts result
