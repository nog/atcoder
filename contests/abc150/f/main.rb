ARG_N = gets.to_i
ARG_a = gets.split.map(&:to_i)
ARG_b = gets.split.map(&:to_i)

i = 0
results = []
OVER =2**31
while i < ARG_N do
  j = 1
  xor = OVER^ARG_a[0+i]^ARG_b[0]
  success = true
  while j < ARG_N do
    if xor != (OVER^ARG_a[(j+i)%ARG_N]^ARG_b[j])
      success = false
      break
    end
    j += 1
  end
  if success
    results.push([i, xor^OVER])
  end
  i+=1
end
results.each do |re|
  puts "#{re[0]} #{re[1]}"
end