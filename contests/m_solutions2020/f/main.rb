N = gets.to_i
X = Array.new N 
Y = Array.new N 
U = Array.new N 
dir = {
    "U" => {},
    "D" => {},
    "R" => {},
    "L" => {}
}
res = nil
N.times do |i|
    x, y, u = gets.split
    x = x.to_i
    y = y.to_i
    X[i], Y[i], U[i] = x, y, u
    dir[u] ||= {}
    if u == 'U' || u == 'D'
        dir[u][x] ||= []
        dir[u][x].push(y)
    else
        dir[u][y] ||= []
        dir[u][y].push(x)
    end
end

x_max = X.max
x_min = X.min
y_max = Y.max
y_min = Y.min

dir['U'].each do |x, y_list|
    if dir['D'][x]
        y_list.each do |y|
            dir['D'][x].each do |ty|
                next if y > ty
                r = (ty - y) * 10 / 2
                res ||= r
                res = r if r < res
            end
        end
    end
    y_list.each do |y|
        dir['L'].each do |ty, x_list|
            next if y > ty
            dy = ty - y
            x_list.each do |tx|
                if x == tx - dy
                    r = dy * 10
                    res ||= r
                    res = r if r < res
                end
            end
        end
        dir['R'].each do |ty, x_list|
            next if y > ty
            dy = ty - y
            x_list.each do |tx|
                if x == tx + dy
                    r = dy * 10
                    res ||= r
                    res = r if r < res
                end
            end
        end
    end
end

dir['D'].each do |x, y_list|
    y_list.each do |y|
        dir['L'].each do |ty, x_list|
            next if y < ty
            dy = y - ty
            x_list.each do |tx|
                if x == tx - dy
                    r = dy * 10
                    res ||= r
                    res = r if r < res
                end
            end
        end
        dir['R'].each do |ty, x_list|
            next if y < ty
            dy = y - ty
            x_list.each do |tx|
                if x == tx + dy
                    r = dy * 10
                    res ||= r
                    res = r if r < res
                end
            end
        end
    end
end

dir['L'].each do |y, x_list|
    if dir['R'][y]
        x_list.each do |x|
            dir['R'][y].each do |tx|
                next if x < tx
                r = (tx - x) * 10 / 2
                res ||= r
                res = r if r < res
            end
        end
    end
end

if res
    puts res
else
    puts "SAFE"
end