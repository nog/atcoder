A, B, C = gets.split.map(&:to_i)

@c = Array.new(101){ Array.new(101){ Array.new(101)}}
ABC = A + B + C
def calc a, b, c
    return @c[a][b][c] if @c[a][b][c]
    abc = a+b+c
    if a == 100 || b == 100 || c == 100
        return 0.0
    end

    res = 1 + (((calc(a+1, b, c))*a.to_f + (calc(a,b+1,c))*b.to_f + (calc(a,b,c+1))*c.to_f) / abc )
    @c[a][b][c] = res
    return res
end

puts calc A, B, C