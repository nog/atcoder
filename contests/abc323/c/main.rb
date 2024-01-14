N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
sorted_a = A.map.with_index{|a, i| [a, i]}.sort.reverse

S = []
scores = []
max = 0
N.times do |i|
    s = gets.chomp.split('')
    S.push(s)
    sc = i + 1
    s.each.with_index do |x, i|
        next if x == 'x'
        sc += A[i]
    end
    scores.push(sc)
    max = sc if sc > max
end

N.times do |i|
    s = S[i]
    sc = scores[i]
    c = 0
    j = 0
    while(sc < max) do
        sa = sorted_a[j]
        if s[sa[1]] == "x"
            c += 1
            sc += A[sa[1]]
        end
        j += 1
    end
    puts c
end