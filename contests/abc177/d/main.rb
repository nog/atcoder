N, M = gets.split.map(&:to_i)
A = Array.new M
B = Array.new M
groups = []
members = Array.new N + 1
result = 1
M.times do |m|
    _a, _b = gets.split.map(&:to_i)
    a, b = nil
    if _a < _b
        a = _a
        b = _b
    else
        a = _b
        b = _a
    end
    # warn "---"
    # warn [a, b].inspect
    if !members[a] && !members[b]
        groups.push({count: 2 })
        members[a] = members[b] = (groups.length - 1)
        if result == 1
            result = 2
        end
    elsif members[a] && members[b]
        unless members[a] == members[b]
            agroup = members[a]
            bgroup = members[b]
            if groups[agroup] == groups[bgroup]
                next
            end

            groups[agroup][:count] += groups[bgroup][:count]
            # groups[agroup][:members] += groups[bgroup][:members]
            groups[bgroup] = groups[agroup]
            if groups[agroup][:count] > result
                result = groups[agroup][:count]
            end
        end
    else
        g = members[a] || members[b]
        groups[g][:count] += 1
        unless members[a]
            members[a] = g
        end
        unless members[b]
            members[b] = g
        end
        if groups[g][:count] > result
            result = groups[g][:count]
        end
    end
    # warn members.inspect
    # warn groups.inspect
end

warn groups.inspect
puts result