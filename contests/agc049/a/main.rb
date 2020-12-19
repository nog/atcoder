N = gets.to_i

state = 0
S = Array.new N
Sto = Array.new N, []

N.times do |i|
    state |= (1 << i)
    S[i] = gets.split('').map(&:to_i)
    N.times do |j|
        if S[i][j] == 1
            Sto[i].push(j)
        end
    end
end 
CACHE = {}
def calc state, count
    return 0 if state == 0
    if CACHE[state]
        return CACHE[state]
    end
    res = 0.0
    hash = {}
    N.times do |i|
        hash[i] = true if state[i]
    end
    N.times do |i|
        next if state[i] == 0
        if Sto[i].size > 0
            hash.delete(i)
            Sto[i].each do |s|
                hash.delete(s)
            end
        end
    end
    hash.keys.each do |k|
        res += 1
        count -= 1
        state ^= (1 << k)
    end

    if count == 0
        CACHE[state] = res
        return res
    elsif count == 1
        CACHE[state] = res + 1
        return res + 1
    end
    N.times do |i|
        next if state[i] == 0
        ns = state.dup
        ns ^= (1 << i)
        cnt = count -1
        queue = [i]
        while(q = queue.shift) do
            Sto[q].each_with_index do |j|
                next if ns[j] == 0
                ns ^= (1 << j)
                cnt -= 1
                queue.push(j)
            end
        end
        res += 1 + calc(ns, cnt)
    end

    result = res.to_f / count
    CACHE[state] = result
    return result
end
puts calc(state, N)