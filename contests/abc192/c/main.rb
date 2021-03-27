N, K = gets.split.map(&:to_i)

a = Array.new K + 1
a[0] = N

def g1 x
    x.to_s.split('').sort.reverse.join('').to_i
end

def g2 x
    x.to_s.split('').sort.join('').to_i
end

def f x
    g1(x) - g2(x)
end

1.upto(K) do |k|
    a[k] = f(a[k-1])
end

puts a[K]