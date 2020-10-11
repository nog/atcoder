n, s = gets.split
N = n.to_i
S = s.chomp.split('')

result = 0
cmap = {}
at = 0
cg = 0

def key at, cg
    100000000 + at * 10000 + cg
end
cmap[key(at, cg)] = 1
S.each do |x|
    if x == 'A'
        at += 1
    elsif x == 'T'
        at -= 1
    elsif x == 'C'
        cg += 1
    elsif x == 'G'
        cg -= 1
    else
        raise
    end
    k = key(at, cg)
    cmap[k] ||= 0
    result += cmap[k]
    cmap[k] += 1
end

puts result