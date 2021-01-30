N = gets.to_i
S = Array.new N 
hash = {}
N.times do |i|
    s = gets.chomp
    if s[0] == "!"
        _s = s[1..-1]
        if hash[_s]
            puts _s
            exit
        end
    else
        if hash["!#{s}"]
            puts s
            exit
        end
    end
    hash[s] = true
end

puts "satisfiable"