N, K = gets.split.map(&:to_i)
MOD= 998244353
@a = []
N.times do
    @a.push(gets.split.map(&:to_i))
end


def xcheck a, b
    N.times do |i|
        if @a[i][a] + @a[i][b] > K
            return false
        end
    end
    true
end

def ycheck a, b
    N.times do |i|
        if @a[a][i] + @a[b][i] > K
            return false 
        end
    end
    true
end

@kaijo = {}
def kaijo x
    if x == 1
        return 1
    end
    @kaijo[x] ||= (x * (kaijo(x - 1))) % MOD
    @kaijo[x]
end

xkeyc = -1 
ykeyc = -1
ygroups = []
ygroup_key = {}
xgroups = []
xgroup_key = {}

N.times do |i|
    xkey = xgroup_key[i] ||= (xkeyc += 1)
    xgroups[xkey] ||= [i]
    ykey = ygroup_key[i] ||= (ykeyc += 1)
    ygroups[ykey] ||= [i]
    (i+1).upto(N-1) do |j|
        unless xgroup_key[j] == xgroup_key[i]
            if xcheck i, j
                if txg_key = xgroup_key[j]
                    xgroups[txg_key].each do |t|
                        xgroup_key[t] = xkey
                    end
                    xgroups[xkey].push(*xgroups[txg_key])
                    xgroups[txg_key] = []
                else
                    xgroup_key[j] = xkey
                    xgroups[xkey].push(j)
                end
            end
        end

        unless ygroup_key[j] == ygroup_key[i]
            if ycheck i, j
                if txg_key = ygroup_key[j]
                    ygroups[txg_key].each do |t|
                        ygroup_key[t] = ykey
                    end
                    ygroups[ykey].push(*ygroups[txg_key])
                    ygroups[txg_key] = []
                else
                    ygroup_key[j] = ykey
                    ygroups[ykey].push(j)
                end
            end
        end
    end
end

warn xgroup_key.inspect
warn xgroups.inspect
warn ygroup_key.inspect
warn ygroups.inspect

result = 1
xgroups.each do |gr|
    next unless gr.size > 0
    result = (result * kaijo(gr.size)) % MOD
end
ygroups.each do |gr|
    next unless gr.size > 0
    result = (result * kaijo(gr.size)) % MOD
end

puts result % MOD