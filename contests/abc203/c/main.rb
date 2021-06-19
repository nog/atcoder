N, K = gets.split.map(&:to_i)

A = Array.new N
B = Array.new N
AB = Array.new N

N.times do |i|
    AB[i] = gets.split.map(&:to_i)
end

ab = AB.sort_by{|ab| ab[0] }


n = K
MAX = 10**100

while(ab[0] && ab[0][0] <= n) do
    _ab =  ab.shift
    n += _ab[1]
end

if n > MAX
    puts MAX
else
    puts n
end