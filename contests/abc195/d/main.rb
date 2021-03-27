N, M, Q = gets.split.map(&:to_i)
WV = Array.new N 
N.times do |i|
    WV[i] = gets.split.map(&:to_i)
end
SWV = WV.sort_by{|x| -x[1]}

# warn SWV.inspect
X = gets.split.map(&:to_i)
Q.times do
    l, r = gets.split.map(&:to_i)
    boxes = []
    if l == 1
        if r == M
            puts 0
            next
        end
        boxes = X[r..(M-1)]
    else
        if r == M
            boxes = X[0...(l-1)]
        else
            boxes = X[0...(l-1)] + X[r..(M-1)]
        end
    end
    # warn boxes.inspect
    boxes.sort!
    result = 0
    SWV.each do |w, v|
        # warn "w,v: #{w}, #{v}, #{boxes.inspect}"
        next if w > boxes[-1]
        i = boxes.find_index do |b|
            b >= w
        end
        next unless i
        boxes.delete_at(i)
        result += v
        # warn "result:#{result}"
        break unless boxes[0]
    end
    puts result
end