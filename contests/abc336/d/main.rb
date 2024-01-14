N = gets.to_i
A = gets.split.map(&:to_i)

la = []
m = 1
A.each do |a|
    if a >= m
        la.push(m)
        m += 1
    else
        m = a
        la.push(m)
        m += 1
    end
end

ra = []
m = 1
A.reverse.each do |a|
    if a > m 
        ra.push(m)
        m += 1
    else
        m = a
        ra.push(m)
        m += 1
    end
end
ra.reverse!

lra = []
N.times do |i|
  lra.push([la[i], ra[i]].min)
end

puts lra.max