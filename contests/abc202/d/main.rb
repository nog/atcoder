A, B, K = gets.split.map(&:to_i)

a = A
b = B

result = []
k = K

def combi(n,k)
  k=n-k if 2*k > n
  return 1 if k == 0
  ((n-k+1)..n).reduce(&:*)/((1..k).reduce(&:*))
end

while(a > 0 && b > 0) do
    half = combi(a+b-1, a-1)
    # warn "k:#{k} half:#{half} a:#{a} b:#{b}"
    if k > half
        b -= 1
        result.push('b')
        k -= half
    else
        a -= 1
        result.push('a')
    end
end

result += ['a'] * a
result += ['b'] * b

puts result.join('')