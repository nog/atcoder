N = gets.to_i
X = Array.new N 
Y = Array.new N 

N.times do |i|
    X[i], Y[i] = gets.split.map(&:to_i)
end
result = 0
(0...N).to_a.combination(2) do |a, b|
    if a > b
        a, b = b, a
    end
    # warn [a,b].inspect
    x1 = X[a]
    y1 = Y[a]

    x2 = X[b]
    y2 = Y[b]

    dy = y2 - y1
    dx = x2 - x1
    next if dx == 0
    katamuki = dy.to_f / dx
    # warn [[x1,y1], [x2,y2], [dx,dy], katamuki].inspect

    if katamuki.abs <= 1 
        result += 1
    end
end

puts result