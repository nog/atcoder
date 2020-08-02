N = gets.to_i
A = gets.split.map(&:to_i)

while A.length > 2 && A[-1] < A[-2] do
    A.pop
end

money = 1000
stock = 0

(A.length - 1).times do |i|
    if A[i] == A[i+1]
        next
    elsif A[i] > A[i+1]
        money += A[i] * stock
        stock = 0
    elsif stock == 0
        stock = money / A[i]
        money -= A[i] * stock
    end
end

puts money + (stock * A[-1])