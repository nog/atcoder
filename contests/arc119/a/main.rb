N = gets.to_i


b = Math.log(N, 2).to_i
a = 1
c = N - 2.pow(b)

result = a + b + c

b.downto(0) do |b|
    a = N / 2.pow(b)
    c = N - (a * 2.pow(b))
    res = (a+b+c)
    result = res if res < result

    a = 1
    c = N - 2.pow(b)
    res = (a+b+c)
    result = res if res < result
end

puts result