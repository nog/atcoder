N, W = gets.split.map(&:to_i)
STP = Array.new N
tl = Array.new 3 * (10**5), 0
N.times do |i|
    _s, _t, _p = gets.split.map(&:to_i)
    tl[_s] += _p
    tl[_t] -= _p
end

w = 0

tl.each do |diff|
    w += diff
    if w > W
        puts "No"
        exit
    end
end

puts "Yes"
