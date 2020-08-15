#10**9 = 2**9*5**9

N = gets.to_i
A = Array.new N

def split n 
    n *= 10**9
    res = {
        2 => 0,
        5 => 0
    }
    while n % 10 == 0 do
        n /= 10
        res[2] += 1
        res[5] += 1
    end
    while n % 2 == 0 do
        n /= 2
        res[2] += 1
    end
    while n % 5 == 0 do
        n /= 5
        res[5] += 1
    end
    res
end
list = []

map = Array.new(18){ Array.new(18){ 0 }}
N.times do |i|
    A[i] = gets.to_f
    sp = split(A[i])
    list.push(sp)
    sp2 = sp[2]
    sp5 = sp[5]
    sp2 = 18 if sp2 > 18
    sp5 = 18 if sp5 > 18
    sp
    map[sp2][sp5] += 1
end

17.downto(0) do |i|
    map[i][18] += map[i+1][18]
    17.downto(0) do |j|
        map[]
    end

res = 0
list = list.sort_by{|x| x[2]}
while(x = list.pop) do
    break unless list[0]
    while(list[0] && x[2] + list[0][2] < 18) do
        break unless list.shift
    end
    list.each do |y|
        if x[5] + y[5] >= 18
            res += 1
        end
    end
end

puts res