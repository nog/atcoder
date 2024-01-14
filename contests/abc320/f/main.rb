N, H = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)
PF = []
(N-1).times do
    PF.push(gets.split.map(&:to_i))
end

@result = nil

def min a, b
    return b unless a
    a < b ? a : b
end

def calc cur, i, h, rev, used, res
    # warn "used:#{used}"
    to = i == -1 ? 0 : X[i]
    if rev
        diff = cur - to
        if diff < 0
            warn "cur:#{cur} i:#{i} h:#{h} rev:#{rev} used:#{used} res:#{res}"
            raise
        end
        return if diff > h
        h -= diff
        if i == -1
            # warn res
            # warn used.inspect
            @result = min @result, res
        else
            calc to, i-1, h, true, used, res
            return if used[i] == 1
            pf = PF[i]
            res += pf[0]
            return if @result && @result < res
            h += pf[1]
            h = min h, H
            calc to, i-1, h, true, used, res
        end
    else
        diff = to - cur
        raise if diff < 0
        return if diff > h
        h -= diff
        if i == N-1
            calc to, i-1,h, true, used, res
        else
            calc to, i+1, h, false, used, res
            used += 1<<i
            pf = PF[i]
            res += pf[0]
            return if @result && @result < res
            h += pf[1]
            h = min h, H
            calc to, i+1, h, false, used, res
        end
    end
end

calc 0, 0, H, false, 0, 0

puts @result || -1