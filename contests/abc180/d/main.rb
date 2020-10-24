X, Y, A, B = gets.split.map(&:to_i)

result = 0
x = X

while(x < Y && B > (x * (A - 1))) do
    x = x * A
    result += 1
end

if x > Y
    x = x / A
    result -= 1
end

result += (Y - x - 1) / B

puts result