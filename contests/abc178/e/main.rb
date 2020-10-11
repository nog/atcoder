N = gets.to_i
X = Array.new N 
Y = Array.new N
dmax = 0
dmin = (10**9) * 2
N.times do |i|
    X[i], Y[i] = gets.split.map(&:to_i)
    d = X[i] + Y[i]
    if d > dmax
        dmax = d
    end
    if d < dmin 
        dmin = d
    end
end

res = dmax - dmin

dmax = -(10**9) * 2
dmin = (10**9) * 2
N.times do |i|
    d = X[i] - Y[i]
    if d > dmax
        dmax = d
    end
    if d < dmin 
        dmin = d
    end
end
res2 = dmax - dmin

puts [res, res2].max