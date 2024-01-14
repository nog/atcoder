N, A, B, C = gets.split.map(&:to_i)
AL = gets.split.map(&:to_i)

listb = AL.map{|a| [a,1] }
results = []

[[A,B,C], [A,C,B], [B,A,C], [B,C,A],[C,A,B],[C,B,A],[A.lcm(B).lcm(C)],[A.lcm(B),C],[C,A.lcm(B)],[A.lcm(C),B],[B,A.lcm(C)],[B.lcm(C),A],[A,B.lcm(C)]].each do |abc|
    res = 0
    list = AL.map{|a| [a,1] }
    abc.each do |x|
        mini = nil
        minc = 10**50
        minlcm = nil
        list.each.with_index do |alcm, i|
            a, lcm = alcm
            lcm = x.lcm(lcm)
            c = (lcm - (a % lcm)) % lcm
            if c < minc
                mini = i
                minc = c
                minlcm = lcm
            end
        end
        list[mini] = [list[mini][0] + minc, minlcm]
        res += minc
    end
    # warn "res:#{res} list:#{list}"
    results.push(res)
end

puts results.min