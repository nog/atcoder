N, C = gets.split.map(&:to_i)
abc = Array.new N

dates = []
changes = Hash.new 0
N.times do |i|
    a, b, c = gets.split.map(&:to_i)
    dates.push(a,b+1)
    changes[a] += c
    changes[b+1] -= c
end

dates.sort!.uniq!
# warn dates.inspect
result = 0

d = dates.shift
current = changes[d]

dates.each do |nd|
    days = nd - d
    if current > C
        result += C * days
    else
        result += current * days
    end
    d = nd
    current += changes[d]
end

puts result