N = gets.to_i
A = gets.split.map(&:to_i)
MOD = 998244353
list = Array.new(N, 0)

(N-1).times do |i|
  a = A[i]
  c = list[i]
  c += Rational(1,a)
  list[i] = c
  1.upto(a) do |d|
    ne = i + d
    if ne >= N-1
      ne = N-1
    end
    list[ne] += Rational(c, a) + 1
  end
  warn list.inspect
end


last = list[N-1]
bunbo = last.denominator
bunsi = last.numerator