N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

counts = Array.new(N+1, 0)
max = 0
maxn = nil

A.each do |a|
    counts[a] += 1
    ca = counts[a]
    if ca > max
        maxn = a
        max = ca
    elsif ca == max
        maxn = a if a < maxn
    end
    puts maxn
end