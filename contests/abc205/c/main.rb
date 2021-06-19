A, B, C = gets.split.map(&:to_i)

if C.odd?
    if A > B
        puts '>'
    elsif A == B
        puts '='
    else
        puts '<'
    end
else
    if A.abs > B.abs
        puts '>'
    elsif A.abs == B.abs
        puts '='
    else
        puts '<'
    end
end