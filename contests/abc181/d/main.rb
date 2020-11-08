S = gets.chomp.split('').map(&:to_i)

if S.size == 1
    if S[0] == 8
        puts 'Yes'
    else
        puts 'No'
    end
    exit
elsif S.size == 2
    if (S[0] * 10 + S[1]) % 8 == 0
        puts 'Yes'
    elsif (S[1] * 10 + S[0]) % 8 == 0
        puts 'Yes'
    else
        puts 'No'
    end
    exit
end

counts = {}
S.each do |s|
    if counts[s]
        counts[s] += 1
    else
        counts[s] = 1
    end
end

13.upto(124) do |x|
    nums = (x*8).to_s.split('').map(&:to_i)
    cnts = {}
    nums.each do |n|
        if cnts[n]
            cnts[n] += 1
        else
            cnts[n] = 1
        end
    end

    result = cnts.keys.all? do |key|
        (counts[key] || 0 ) >= (cnts[key] || 0)
    end
    if result
        puts 'Yes'
        exit
    end

end

puts 'No'