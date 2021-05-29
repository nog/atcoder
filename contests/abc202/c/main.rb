N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)

amap = {}
A.each do |a|
    if amap[a]
        amap[a] += 1
    else
        amap[a] =1
    end
end

result = 0
C.each do |c|
    c -= 1
    b = B[c]
    result += amap[b] || 0
end

puts result