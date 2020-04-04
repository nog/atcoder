n, k, c = gets.split.map(&:to_i)
s = gets.chomp.split('')

s.length.times do |i|
end

i = 0
kk = k
lefts = []
while(kk>0) do
  if s[i] != 'x'
    kk -= 1
    lefts.push(i)
    i += c
  end
  i+= 1
end
i = n - 1
kk = k
rights = []
while(kk>0) do
  if s[i] != 'x'
    kk -= 1
    rights.unshift(i)
    i -= c
  end
  i -= 1
end
k.times do |i|
  if lefts[i] == rights[i]
    puts lefts[i] + 1
  end
end