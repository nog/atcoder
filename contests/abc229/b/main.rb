A, B = gets.split

alen = A.length
blen = B.length
len = alen > blen ? blen : alen

len.times do |i|
  if A[-1-i].to_i + B[-1-i].to_i > 9
    puts 'Hard'
    exit
  end
end
puts 'Easy'