N = gets.to_i
a = gets.split.map(&:to_i).sort
a.uniq!

hash = {}
a.each do |x|
    hash[x] = true
end

while(a[0] != a[-1]) do
    a.uniq!
    if a.size < 100
        warn a.inspect
        warn a.size
        warn "---"
    end
    min = a[0]
    xmin = 2 * min
    if a[-1] >= xmin
        new_a = []
        (a.size-1).downto(0) do |i|
            b = a[i]
            if b >= xmin
                c = b - (min * ((b-min) / min))
                unless hash[c]
                    hash[c] = true
                    new_a.push(c)
                end
            else
                if new_a.size > 0
                    new_a += a[0..i]
                    new_a.sort!
                else
                    new_a = a[0..i]
                end
                break
            end
        end
        a = new_a
    end
    if a[-1] == a[0]
        break
    end
    while(2 * a[0] >= a[-1]) do
        if a.size == 1
            puts a[0]
            exit
        end
        x = a.pop - a[0]
        unless hash[x]
            hash[x] = true
            a.unshift(x)
        end
    end
end

puts a[0]