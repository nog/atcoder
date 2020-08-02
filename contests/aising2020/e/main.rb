T = gets.to_i
results = Array.new T
T.times do |i|
    div = 100000
    n = gets.to_i
    score = 0
    l_list = []
    r_list = []
    n.times do |i|
        k, l, r = gets.split.map(&:to_i)
        if l == r || k == n
            score += l
        elsif l > r
            score += r
            l_list.push([k, l-r])
        else
            score += l
            r_list.push([n-k, r-l])
        end
    end
    [l_list,r_list].each do |list|
        list = list.sort_by{|x| x[0]}
        mure = SortedSet.new
        size = 0
        before_k = 0
        sorted = true
        adds = []
        list.each do |k, v|
            if before_k > 0 && k != before_k && adds.size > 0
                if before_k > mure.size
                    mure.push(*adds)
                else
                    adds = adds.sort
                    over = mure.size + adds.size - before_k
                    mure = mure.sort
                    if adds[-1] > mure[0]
                        list = (adds + mure[0..(over - 1)]).sort
                        mure = mure[over..-1] + list[-over..-1]
                    end
                end
                mure = mure.sort[-before_k..-1] if before_k < mure.size
            end
            adds.push(v)
            before_k = k
        end
        mure.push(*adds)
        if before_k < mure.size
            mure = mure.sort[-before_k..-1]
        end
        score += mure.sum
    end
    results[i] = score
end

puts results.join("\n")