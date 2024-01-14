K = gets.to_i
if K <= 10
    puts K
    exit
end

l = [[1]*10]
nl = [0]
k = K - 9

while(true) do
    top = nl.size
    c = l[-1][0..(top-1)].sum
    nl.push(c)
    if c >= k
        res = [top]
        l.size.times do |i|
            l[-1-i].each.with_index do |c, j|
                if c >= k
                    res.push(j)
                    break
                else
                    k -= c
                end
            end
        end
        puts res.join('')
        # warn l.inspect
        # warn nl.inspect
        # warn top
        exit
    else
        k -= c
    end
    if nl.size == 10
        l.push(nl)
        nl = [0]
        if l.size == 10
            if k == 1
                puts 9876543210
            else
                puts -1
            end
            exit
        end
    end
end