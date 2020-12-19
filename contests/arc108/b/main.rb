N = gets.to_i
s = gets.chomp.split('')

resetcount = {
    "f" => 0,
    "o" => 0,
}

queue = []

result = 0

s.each do |_s|
    if _s == "f"
        queue.push(_s)
    elsif _s == "o"
        if queue[-1] == "f"
            queue.push(_s)
        else
            result += queue.size + 1
            queue = []
        end
    elsif _s == "x"
        if queue[-1] == "o" && queue[-2] == "f"
            queue.pop
            queue.pop
        else
            result += 1 + queue.size
            queue = []
        end
    else
        result += 1 + queue.size
        queue = []
    end
end

puts result + queue.size
