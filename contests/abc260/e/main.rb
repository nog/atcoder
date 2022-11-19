N, M = gets.split.map(&:to_i)
AB = Array.new N
A_B = Array.new(M+1, -1)
B_A = Array.new(M+1, M+1)

def min a, b
  a < b ? a : b
end
def max a, b
  a < b ? b : a
end
N.times do |i|
  a, b = gets.split.map(&:to_i)
  A_B[a] = max(A_B[a], b)
  B_A[b] = min(B_A[b], a)
end

results = Array.new(M){  Hash.new }
results[M-1][1] = M

(M-1).downto(1) do |n|
  before = results[n]
  break if before.size == 0
  res = {}
  before.each do |min, max|
    # warn "n:#{n} max:#{max} min:#{min}"
    if !res[min+1] && B_A[min] == M+1 && (A_B[min] <= max)
      res[min+1] = max
    end
    if !res[min] && A_B[max] == -1 && (B_A[max] >= min)
      res[min] = max-1
    end
  end
  results[n-1] = res
end

puts results.map{|res|
  # warn res.inspect
  res.size
}.join(' ')