s = gets.chomp
a = 2019
result = 0
pat = []
1.upto(999) do |i|
  x = a * i
  if x.to_s.include?('0')
    next
  end
  pat.push x
end
len = s.length
pos = 0
fregxp = Regexp.compile(pat.join("|"))
matches = []
while true do
  m = s.match(fregxp, pos)
  unless m 
    break
  end
  pos = m.begin(0) + 1
  matches.push([m.begin(0), m.end(0), m.end(0) - m.begin(0)])
  result += 1
end
while match = matches.shift
  e = match[1]
  matches.each do |m2|
    if m2[0] == e + 1
      result += 1
      e = m2[1]
    end

    if m2[0] > e + 1
      break
    end
  end
end



puts result