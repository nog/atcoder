N, Q = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
box = Array.new(N)
N.times do |i|
    c = C[i]
    box[i] = c
end

Q.times do
    a, b = gets.split.map(&:to_i)
    a -= 1
    b -= 1
    ba = box[a]
    bb = box[b]
    if ba.is_a?(Hash)
        if bb.is_a?(Hash)
            bb.merge!(box[a])
            box[a] = nil
        elsif bb
            box[b] = ba
            box[b][bb] = true
        else
            box[b] = ba
        end
    elsif ba
        if bb.is_a?(Hash)
            bb[ba] = true
        elsif bb
            box[b] = {
                ba => true,
                bb => true
            }
        else
            box[b] = ba
        end
    end
    box[a] = nil
    bb = box[b]
    if bb.is_a?(Hash)
        puts bb.keys.count
    elsif bb
        puts 1
    else
        puts 0
    end
end