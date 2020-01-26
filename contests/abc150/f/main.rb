ARG_N = gets.to_i
ARG_a = gets.split.map(&:to_i)
ARG_b = gets.split.map(&:to_i)
xa, xb = Array.new(ARG_N), Array.new(ARG_N)
i = 0
OVER = 2**31
while i < ARG_N do
  xa[i] = ARG_a[i] ^ ARG_a[i-1]
  xb[i] = ARG_b[i] ^ ARG_b[i-1]
  i+=1
end
xa += xa
results = []

def kmp_table arr 
  result = Array.new(arr.length)
  result[0] = 0
  j = 0
  1.upto(arr.length-1) do |i|
    result[i] = j
    if arr[i] == arr[j]
      j+=1
    else
      j= 0
    end
  end
  result[arr.length] = j
  result
end

table = kmp_table(xb)
# p xb
# p table

i = 0
j = 0
while i < (ARG_N * 2) -1 do
  # p [i,j]
  if xa[i] == xb[j]
    i+=1
    j+=1
  elsif j == 0
    i+=1
  else
    j = table[j]
  end
  if j == ARG_N
    r = (i-j) % ARG_N
    results.push([r, ARG_a[r]^ARG_b[0]])
    j = table[j]
  end
end
results.each do |re|
  puts "#{re[0]} #{re[1]}"
end