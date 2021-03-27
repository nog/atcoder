A, B, C = gets.split.map(&:to_i)


bc = B.pow(C, 4)
bc = 4 if bc == 0
puts A.pow(bc, 10)
exit

amod = A % 10
if amod == 1
    puts 1
    exit
elsif amod == 5
    puts 5
    exit
elsif amod == 6
    puts 6
    exit 
elsif amod == 9
    puts A.pow(B.pow(C, 2), 10)
    exit
elsif amod == 2
    bc = B.pow(C, 4)
    bc = 4 if bc == 0
    puts A.pow(bc, 10)
    exit
elsif amod == 3
    puts A.pow(B.pow(C, 4), 10)
    exit
elsif amod == 4
    bc = B.pow(C, 2)
    if bc == 1
        puts 4
    else
        puts 6
    end
    exit
elsif amod == 7
    puts A.pow(B.pow(C, 4), 10)
    exit
elsif amod == 8
    bc = B.pow(C, 4)
    bc = 4 if bc == 0
    puts A.pow(bc, 10)
    exit
end