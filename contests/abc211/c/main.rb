S = gets.chomp.split('')
len = S.length
MOD = 10**9+7

ccounts = Array.new len, 0
hcounts = Array.new len, 0
ocounts = Array.new len, 0
kcounts = Array.new len, 0
ucounts = Array.new len, 0
dcounts = Array.new len, 0
acounts = Array.new len, 0
icounts = Array.new len, 0

len.times do |i|
  if S[i] == "c"
    ccounts[i] = ccounts[i-1] + 1
  else
    ccounts[i] = ccounts[i-1]
  end

  if S[i] == "h"
    hcounts[i] = hcounts[i-1] + ccounts[i]
  else
    hcounts[i] = hcounts[i-1]
  end

  if S[i] == "o"
    ocounts[i] = ocounts[i-1] + hcounts[i]
  else
    ocounts[i] = ocounts[i-1]
  end

  if S[i] == "k"
    kcounts[i] = kcounts[i-1] + ocounts[i]
  else
    kcounts[i] = kcounts[i-1]
  end

  if S[i] == "u"
    ucounts[i] = ucounts[i-1] + kcounts[i]
  else
    ucounts[i] = ucounts[i-1]
  end

  if S[i] == "d"
    dcounts[i] = dcounts[i-1] + ucounts[i]
  else
    dcounts[i] = dcounts[i-1]
  end

  if S[i] == "a"
    acounts[i] = acounts[i-1] + dcounts[i]
  else
    acounts[i] = acounts[i-1]
  end

  if S[i] == "i"
    icounts[i] = icounts[i-1] + acounts[i]
  else
    icounts[i] = icounts[i-1]
  end
end

# warn ccounts.inspect
# warn hcounts.inspect
# warn ocounts.inspect
# warn kcounts.inspect
# warn ucounts.inspect
# warn dcounts.inspect
# warn acounts.inspect
# warn icounts.inspect

puts icounts[-1] % MOD
