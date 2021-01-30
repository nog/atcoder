A, B = gets.split

a = 0
b = 0
A.chars.each do |s|
    a += s.to_i
end

B.chars.each do |s|
    b += s.to_i 
end

if a > b 
    puts a 
else
    puts b 
end