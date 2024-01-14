N = gets.to_i
A = gets.split.map(&:to_i)
S = gets.chomp.split('')

mlist = []
elist = []
xlist = []

mcounts = Array.new(3){ Array.new(N+1) }
ecounts = Array.new(3){ Array.new(N+1) }
xcounts = Array.new(3){ Array.new(N+1) }
3.times do |i|
    mcounts[i][0] = 0
    ecounts[i][0] = 0
    xcounts[i][0] = 0
end

N.times do |i|
    s = S[i]
    a = A[i]

    3.times do |j|
        mcounts[j][i+1] = mcounts[j][i]
        ecounts[j][i+1] = ecounts[j][i]
        xcounts[j][i+1] = xcounts[j][i]
    end
    if s == "M"
        mcounts[a][i+1] += 1
    elsif s == "E"
        ecounts[a][i+1] += 1
    elsif s == "X"
        xcounts[a][i+1] += 1
    end

    x = nil
    if a == 0
        x = 1
    elsif a == 1
        x = 2
    elsif a == 2
        x = 4
    else
        raise
    end
    if s == "M"
        mlist.push([i,x])
    elsif s == 'E'
        elist.push([i,x])
    elsif s == 'X'
        xlist.push([i,x])
    else
        raise
    end
end
res = 0

def mex x
    if x[0] == 0
        return 0
    elsif x[1] == 0
        return 1
    elsif x[2] == 0
        return 2
    else
        return 3
    end
end

X = [1,2,4]
res = 0
elist.each do |ei, ex|
    mc = []
    xc = []
    mc[0] = mcounts[0][ei]
    mc[1] = mcounts[1][ei]
    mc[2] = mcounts[2][ei]
    xc[0] = xcounts[0][-1] - xcounts[0][ei]
    xc[1] = xcounts[1][-1] - xcounts[1][ei]
    xc[2] = xcounts[2][-1] - xcounts[2][ei]

    3.times do |mx|
        mcc = mc[mx]
        3.times do |xx|
            _mex = mex(ex| X[mx] | X[xx])
            next if _mex == 0
            res += (mcc * xc[xx]) * _mex
        end
    end
end

puts res