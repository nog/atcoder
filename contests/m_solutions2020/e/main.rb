N = gets.to_i
X = Array.new N 
Y = Array.new N 
P = Array.new N 
N.times do |i|
    X[i], Y[i], P[i] = gets.split.map(&:to_i)
end

def min a, b
    a < b ? a : b
end

results = []

res = 0
N.times do |i|
    res += min(X[i].abs, Y[i].abs) * P[i]
end
results.push(res)

x_list = X.uniq
y_list = Y.uniq
max = min(x_list.size, y_list.size)

1.upto(max - 1) do |k|
    dis = 0
end

max.upto(N) do |k|
    results.push(0)
end

results.each do |res|
    puts res
end