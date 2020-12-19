N, K = gets.split.map(&:to_i)
ST = gets.chomp

P, S, R = "P", "S", "R"

s = ST.split('')
K.times do
    new_s = Array.new N
    N.times do |i|
        l,r = s[(2*i)%N], s[(2*i+1)%N]
        if l == P
            if r == S
                new_s[i] = r
            else
                new_s[i] = l
            end
        elsif l == R
            if r == P
                new_s[i] = r 
            else
                new_s[i] = l
            end
        elsif l == S
            if r == R
                new_s[i] = r
            else
                new_s[i] = l
            end
        else
            raise
        end
    end
    s = new_s
end

puts s[0]