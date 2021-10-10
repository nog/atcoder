N = gets.to_i

S = Array.new N 
T = Array.new N

N.times do |i|
  S[i] = gets.chomp.split('').map{|x| x == '#' ? 1 : 0 }
end
N.times do |i|
  T[i] = gets.chomp.split('').map{|x| x == '#' ? 1 : 0 }
end
t = T

s = S
while(s[0].all?{|x| x == 0 }) do
  s.shift
end
while(s[-1].all?{|x| x == 0 }) do
  s.pop
end
s = s.reverse.transpose
while(s[0].all?{|x| x == 0 }) do
  s.shift
end
while(s[-1].all?{|x| x == 0 }) do
  s.pop
end
s = s.transpose.reverse

while(t[0].all?{|x| x == 0 }) do
  t.shift
end
while(t[-1].all?{|x| x == 0 }) do
  t.pop
end
t = t.reverse.transpose
while(t[0].all?{|x| x == 0 }) do
  t.shift
end
while(t[-1].all?{|x| x == 0 }) do
  t.pop
end
t = t.transpose.reverse

if s == t
  puts 'Yes'
  exit
end

3.times do
  s = s.reverse.transpose
  if s == t
    puts 'Yes'
    exit
  end
end

puts 'No'