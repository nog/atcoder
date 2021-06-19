N = gets.to_i
X = Array.new N
Y = Array.new N

minx = nil
minx_i = nil
minx2 = nil
minx2_i = nil
maxx = nil
maxx_i = nil
maxx2 = nil
maxx2_i = nil

miny = nil
miny_i = nil
miny2 = nil
miny2_i = nil
maxy = nil
maxy_i = nil
maxy2 = nil
maxy2_i = nil

N.times do |i|
    x, y = gets.split.map(&:to_i)
    X[i], Y[i] = x, y
    if !minx || x < minx
        minx2 = minx
        minx2_i = minx_i

        minx = x
        minx_i = i
    elsif !minx2 || x < minx2
        minx2 = x
        minx2_i = i
    end

    if !maxx || x > maxx
        maxx2 = maxx
        maxx2_i = maxx_i

        maxx = x
        maxx_i = i
    elsif !maxx2 || x > maxx2
        maxx2 = x
        maxx2_i = i
    end

    if !miny || y < miny
        miny2 = miny
        miny2_i = miny_i

        miny = y
        miny_i = i
    elsif !miny2 || y < miny2
        miny2 = y
        miny2_i = i
    end

    if !maxy || y > maxy
        maxy2 = maxy
        maxy2_i = maxy_i

        maxy = y
        maxy_i = i
    elsif !maxy2 || y > maxy2
        maxy2 = y
        maxy2_i = i
    end
end


first = 0
second = 0

def distance j, k
    x = (X[j] - X[k]).abs
    y = (Y[j] - Y[k]).abs
    (x > y) ? x : y
end

kouho = [minx_i, minx2_i, maxx_i, maxx2_i, miny_i, miny2_i, maxy_i, maxy2_i].uniq
# warn [minx_i, minx2_i, maxx_i, maxx2_i, miny_i, miny2_i, maxy_i, maxy2_i].inspect
# warn kouho.inspect

N.times do |i|
    kouho.each do |k|
        next if  i <= k
        d = distance(i, k)
        if d > first
            second = first
            first = d
        elsif d > second
            second = d
        end
    end
end

puts second