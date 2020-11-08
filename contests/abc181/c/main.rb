N = gets.to_i
x = Array.new N 
y = Array.new N 
N.times do |i|
    x[i], y[i] = gets.split.map(&:to_i)
end

0.upto(N-3) do |i|
    ax = x[i]
    ay = y[i]
    (i+1).upto(N-2) do |j|
        bx = x[j]
        by = y[j]
        dx = bx - ax
        dy = by - ay
        (j+1).upto(N-1) do |k|
            cx = x[k]
            cy = y[k]
            if (cy - ay) * dx == dy * (cx - ax)
                puts "Yes"
                exit
            end
        end
    end
end

puts "No"