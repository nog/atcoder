N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

maxa = A[0]
maxb = B[0]
maxa_i = 0
maxb_i = 0

prev = maxa * maxb
puts prev

1.upto(N-1) do |i|
    a = A[i]
    b = B[i]
    if a > maxa
        maxa = a if a > maxa
        maxa_i = i 
    end
    if b > maxb
        maxb = b if b > maxb
        maxb_i = i 
    end
    prev = [prev, b * maxa, a * b].max
    puts prev
end