N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

K = Array.new Q
Q.times do |i|
    K[i] = gets.to_i
end
sorted_k = K.sort
result_map = {}

ai = 0
a = A[ai]
x = 0
bk = 0

ki = 0
A.push(10**19)

while(k = sorted_k[ki]) do
    x += k - bk
    while(x >= a) do
        x += 1
        ai += 1
        a = A[ai]
        # warn "a:#{a} x:#{x}"
    end
    result_map[k] = x
    bk =k
    ki += 1
end

K.each do |k|
    puts result_map[k]
end