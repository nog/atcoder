N, L = gets.split.map(&:to_i)
K = gets.to_i
A = gets.split.map(&:to_i)

warn ((A.min)..(L/(K+1))).inspect
res = ((A.min)..(L/(K+1))).bsearch do |l|
    x = 0
    count = 0
    A[0..-1].each do |a|
        if a - x >= l
            count += 1
            x = a
        end
    end
    ((count >= K) && (L-x) >= l) ? true : false
end
puts res