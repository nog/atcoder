N = gets.to_i
CAA = gets.to_i 
CAB = gets.to_i
CBA = gets.to_i
CBB = gets.to_i

if N <= 3
    puts 1
    exit
end

if CAB == "A" && CAA == "A"
    puts 1
    exit
elsif CAB == "B" && CBB == "B"
    puts 1
    exit
end