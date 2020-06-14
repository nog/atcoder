N, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

def next_array a
  r = Array.new N, 0
  a.each_with_index do |_a, i|
    min = i - _a
    if min < 0
      min = 0
    end
    max = i + _a
    r[min] += 1
    r[max+1] -= 1 if max < N - 1
  end
  1.upto(N-1) do |i|
    r[i] += r[i-1]
  end
  r
end

def nth_array arr, n
  if n > N
    return Array.new n, n
  end

  result = Array.new N, 0
  arr.each_with_index do |_a, i|
  end
end

now = a
now = next_array now
k -= 1
k.times do |i|
  next_ar  = next_array now
  if next_ar == now
    break
  end
  now = next_ar
end

puts now.join(' ')