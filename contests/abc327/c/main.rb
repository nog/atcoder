A = []
9.times do
    A.push(gets.split.map(&:to_i))
end

correct = [1,2,3,4,5,6,7,8,9]
A.each do |line|
    if line.sort != correct
        puts 'No'
        exit
    end
end

A.transpose.each do |line|
    if line.sort != correct
        puts 'No'
        exit
    end
end

3.times do |h|
    3.times do |w|
        l = []
        3.times do |i|
            3.times do |j|
                l.push(A[h*3+i][w*3+j])
            end
        end
        if l.sort != correct
            puts 'No'
            exit
        end
    end
end

puts 'Yes'