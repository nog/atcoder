B, C = gets.split.map(&:to_i)
result = 0
ranges = []
patterns = []

# -1倍をしないパターン
a_max = B
a_min = B - (C/2)
patterns.push([a_min, a_max])

result += a_max - a_min + 1
ranges.push(a_min..a_max)

# 最後に-1倍をするパターン
b_min = - B
b_max = - (B - (C-1) / 2)
patterns.push([b_min, b_max])


# 最初に-1倍をするパターン
c_max = - B
c_min = - B - (C-1) / 2
patterns.push([c_min, c_max])

# 最初に-1倍をしたあと最後に-1倍するパターン
d_min = B
d_max = (B + (C-2) / 2)
if C > 2
    patterns.push([d_min, d_max])
end

patterns.each do |min, max|
    fullcover = false
    ranges.each do |range|
        if range.cover?(min)
            if range.cover?(max)
                fullcover = true
                break
            end
            min = range.max + 1
        elsif range.cover?(max)
            max = range.min - 1
        end
    end
    unless fullcover
        result += max - min + 1
        ranges.push(min..max)
    end
end

puts result