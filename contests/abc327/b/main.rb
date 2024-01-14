B = gets.to_i

1.upto(100) do |i|
    x = i.pow(i)
    if x == B
        puts i
        exit
    elsif x > B
        puts -1
        exit
    end
end