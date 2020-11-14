H, W, N, M = gets.split.map(&:to_i)
A = Array.new N 
B = Array.new N
C = Array.new M 
D = Array.new M 
lights_h = Array.new(H){ [] }
blocks_h = Array.new(H){ [] }
lights_w = Array.new(W){ [] }
blocks_w = Array.new(W){ [] }
lights = Array.new(N)

result = 0
BLOCK = 1
LIGHT_YOKO = 2
LIGHT_TATE = 3
LIGHT_TATE_YOKO = 4
field = Array.new(H){ Array.new(W,nil) }
N.times do |i|
    a, b = gets.split.map(&:to_i)
    a -= 1
    b -= 1
    lights[i] = [a,b]
    lights_h[a].push(b)
    lights_w[b].push(a)
end
M.times do |i|
    c, d = gets.split.map(&:to_i)
    c -= 1
    d -= 1
    field[c][d] = BLOCK
    blocks_h[c].push(d)
    blocks_w[d].push(c)
end

N.times do |i|
    h, w = lights[i]

    if field[h][w] == nil || field[h][w] == LIGHT_TATE
        w.downto(0) do |_w|
            f = field[h][_w]
            if f == BLOCK
                break
            elsif f == nil
                field[h][_w] = LIGHT_YOKO
                result += 1
            elsif f == LIGHT_TATE
                field[h][_w] = LIGHT_TATE_YOKO
            else
                raise
            end
        end
        (w+1).upto(W-1) do |_w|
            f = field[h][_w]
            if f == BLOCK
                break
            elsif f == nil
                field[h][_w] = LIGHT_YOKO
                result += 1
            elsif f == LIGHT_TATE
                field[h][_w] = LIGHT_TATE_YOKO
            else
                warn f
                raise
            end
        end
    end


    if field[h][w] == nil || field[h][w] == LIGHT_YOKO
        h.downto(0) do |_h|
            f = field[_h][w]
            if f == BLOCK
                break
            elsif f == nil
                field[_h][w] = LIGHT_TATE
                result += 1
            elsif f == LIGHT_YOKO
                field[_h][w] = LIGHT_TATE_YOKO
            else
                raise
            end
        end
        (h+1).upto(H-1) do |_h|
            f = field[_h][w]
            if f == BLOCK
                break
            elsif f == nil
                field[_h][w] = LIGHT_TATE
                result += 1
            elsif f == LIGHT_YOKO
                field[_h][w] = LIGHT_TATE_YOKO
            else
                raise
            end
        end
    end
end

puts result