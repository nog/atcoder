N = gets.to_i

alist = []
blist = []

MAX = 10**18

a = 3
b = 5
while a <= N do
    alist.push(a)
    a *= 3
end

while b <= N
    blist.push(b)
    b *= 5
end

alist.each_with_index do |a, ai|
    blist.each_with_index do |b, bi|
        if a + b == N
            puts "#{ai + 1} #{bi + 1}"
            exit
        elsif a + b > N
            break
        end
    end
    if a > N
        break
    end
end

puts -1