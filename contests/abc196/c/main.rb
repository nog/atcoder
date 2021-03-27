N = gets.to_i
if N < 11
    puts 0 
    exit
end

i = 1
while(true) do
    x = (i.to_s + i.to_s).to_i
    if x <= N
        i += 1
    else
        break
    end
end

puts i-1