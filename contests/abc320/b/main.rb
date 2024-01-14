S = gets.chomp

len = S.length

len.downto(1) do |l|
    (S.length - l + 1).times do |st|
        s = S[st..st+l-1]
        if s == s.reverse
            puts l
            exit
        end
    end
end