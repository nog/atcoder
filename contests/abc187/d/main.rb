N = gets.to_i
A = Array.new N 
B = Array.new N 
suma = 0
takapower = Array.new N
N.times do |i|
    a, b = gets.split.map(&:to_i)
    A[i], B[i] = a, b
    suma += a
    takapower[i] = (2 * a) + b
end

result = 0
taka = 0

takapower.sort.reverse.each do |t|
    result += 1
    taka += t
    if taka > suma
        break
    end
end

puts result