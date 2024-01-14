$stdout.sync = true
N, K = gets.split.map(&:to_i)

c = N
res = Array.new(N)
x = (1..(K-1)).to_a

zero = []
one = []

K.upto(N) do |i|
    puts "? #{x.join(' ')} #{i}"
    r = gets.to_i
    c -= 1
    if r == 0
        zero.push(i)
    else
        one.push(i)
    end
    res[i-1] = r
end


list = []
list.push(*zero)
if list.size.odd?
    list.pop
end
list.push(*one)
if list.size.odd?
    list.pop
end