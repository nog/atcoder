S = gets.chomp.split('').map(&:to_i)

len = S.length
stat = 0
sc = Array.new(len+1)
sc[0] = stat

pows = [1]
9.times do
  pows.push(pows[-1] * 2)
end
# warn pows.inspect
len.times do |i|
  s = S[i]
  d = pows[s]
  if stat[s] == 1
    stat -= pows[s]
  else
    stat += pows[s]
  end
  sc[i+1] = stat
  # warn "s:#{s} d:#{d} stat:#{stat} #{stat.to_s(2)}"
end
# warn sc.inspect
r = 0
counts = {}

sc.each do |st|
  counts[st] ||= 0
  r += counts[st]
  counts[st] += 1
end

puts r