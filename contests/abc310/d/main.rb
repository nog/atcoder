N, T, M = gets.split.map(&:to_i)
hash = {}
M.times do 
    a, b = gets.split.map(&:to_i)
    hash[a] ||= {}
    hash[b] ||= {}
    hash[a][b] = true
    hash[b][a] = true
end
res = 0

teams = []
(1..(N+1-T)).to_a.repeated_combination(T).each do |list|
    next if list.sum != N
    teams.push(list.reverse)
end

res = 0

warn teams.inspect
list = (1..N).to_a
teams.each do |team|
    ll = [list]
    (T).times do |t|
        nll = []
        m = team[t]
        break if m == 1
        ll.uniq!
        ll.each do |l|
            # warn l.inspect
            l.combination(m).each do |x|
                ok = true
                x.size.times do |i|
                    hxi = hash[x[i]]
                    next unless hxi
                    i.times do |j|
                        if hxi[x[j]]
                            ok = false
                            break
                        end
                    end
                    break unless ok
                end
                if ok
                    nll.push(l-x)
                end
            end
        end
        ll = nll
        # warn ll.inspect
    end
    warn "!#{ll.size}"
    if ll.size > 0
        if ll[0].size == 0
            res += ll.size
        else
            res += ll.uniq.size
        end
    end
end

puts res