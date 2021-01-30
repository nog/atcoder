N = gets.to_i
A = gets.split.map(&:to_i)

a =  []
A.each_with_index do |_a, i|
    a.push([i, _a])
end

while a.size > 2 do
    size = a.size
    new_a = []
    (size / 2).times do |i|
        aa, ab = a[2*i], a[2*i+1]
        if aa[1] > ab[1]
            new_a.push aa
        else
            new_a.push ab
        end
    end
    a = new_a
end

if a[0][1] > a[1][1]
    puts a[1][0] + 1
else
    puts a[0][0] + 1
end