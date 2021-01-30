N = gets.to_i
S = Array.new N 
N.times do |i|
    S[i] = gets.chomp
end

tCount = 1
fCount = 1

N.times do |i|
    nt = nil
    nf = nil 
    if S[i] == "AND"
        nf = fCount + tCount + fCount
        nt = tCount
    else
        nt = tCount + fCount + tCount
        nf = fCount
    end
    tCount, fCount = nt, nf
end

puts tCount