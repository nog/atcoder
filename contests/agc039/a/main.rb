# encoding: UTF-8
s = gets.chomp.to_s
k = gets.chomp.to_i

def count str, opts={}
  first = opts[:first] || 0
  last = opts[:last] || -1
  replaced = str.gsub(/([a-z])(\1)/, '\1A')
  return 0 unless replaced
  replaced[first..last].count('A')
end

if s.match(/^([a-z])\1*$/)
  puts ((s.length * k) / 2).to_i
  exit
end

if k == 1
  puts count(s)
  exit
end

if s[0] != s[-1]
  puts count(s) * k
  exit
end

first = s.match(/^([a-z])\1*/)[0]
last = s.match(/([a-z])\1*$/)[0]

first_count = count(s + first, last: (- first.length - 1))
last_count = count(last + s, first: last.length)

if k == 2
  puts first_count + last_count
  exit
end

puts first_count + last_count +
  (count(
   last + s + first,
   first: last.length,
   last: (- first.length - 1) 
  ) * (k-2))