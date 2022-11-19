N = gets.to_i
PL = gets.split.map(&:to_i)

pluses = []
minuses = []
PL.each.with_index do |x, i|
  if (x - i) % MOD < N / 2
    minuses.push(x-i)
  else
    pluses.push
end