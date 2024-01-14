N, M = gets.split.map(&:to_i)
P = gets.split.map(&:to_i).sort!
L = gets.split.map(&:to_i)
D = gets.split.map(&:to_i)

LD = []
M.times do |i|
    LD.push([L[i], D[i]])
end
LD.sort!

d = [[0,0], [0,0]]
LD.each do |l, d|
    i = d
    while(P[i] < l) do
        i += 1
    end
end