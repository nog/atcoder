N = gets.to_i
P = gets.split.map(&:to_i)

if P[0] == 1
    puts -1
    exit
elsif P[-1] == N
    puts -1
    exit
end

results = []
N.times do |i|
    if P[i] == 1
        i.downto(1) do |j|
            results.puts(j)
        end
    end
end

queue = [[1, N]]
result = []
while(from, to = q.shift) do
    max = P[from-1]
    (from + 1).upto(to) do |i|
        if i == max && P[i+1] < max
            P[i], P[i+1] = P[i+1], P[i]
            puts i
        end
    end
end
