X = gets.chomp
M = gets.to_i

d = X.split('').sort[-1].to_i

result = 0
xlen = X.length
xlist = X.split('').map(&:to_i).reverse.map.with_index{|n,i|
    n > 0 ? [i,n] : nil
}.compact.reverse

if xlen == 1
    if X.to_i > M
        puts 0
    else
        puts 1
    end
    exit
end

warn xlist.inspect

a = (d+1...100000).bsearch do |d|
    dd = d**(xlen)
    if dd <= M
        false
    else
        xx = 0
        res = false
        xlist.each do |i, n|
            dd = d ** i
            xx += n * dd
            if xx > M
                res = true
                break
            elsif M >= dd + xx
                res = false
                break
            end
            dd = dd / d
        end
        res
    end
end
puts a - d - 1