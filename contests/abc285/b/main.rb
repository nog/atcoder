N = gets.to_i 
S = gets.chomp.split('')

hash = {}
S.each.with_index do |s, i|
  hash[s] ||= []
  hash[s].push(i)
end

results = Array.new(N-1)

S.each.with_index do |s, i|
  hash[s].shift
  hash[s].each do |x|
    d = x - i
    results[d] ||= i
  end
end

1.upto(N-1) do |i|
  result = 0
  lmax = N - i
  if results[i]
    puts [results[i], lmax].min
  else
    puts lmax
  end
end