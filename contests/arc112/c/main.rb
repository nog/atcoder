N = gets.to_i
POINTS = gets.split.map(&:to_i)

TREE = {}

i = 2
POINTS.each do |x|
    TREE[x] ||= []
    TREE[x].push(i)
    i+=1
end

def resolve x
    childs = TREE[x]
    unless childs
        return [1, 0, true]
    end

    jibun = 1
    teki = 0
    toku_kouho = []
    son_kouho = []
    change_kouho = []
    childs.each do |c|
        res = resolve(c)
        a, b, c = res
        if c
            change_kouho.push(res)
        elsif b > a
            toku_kouho.push(res)
        else
            son_kouho.push(res)
        end
    end

    toku_kouho.each do |a,b,c|
        teki += a
        jibun += b
    end

    change_kouho = change_kouho.sort_by{|a,b,c| -(b - a)}

    turn = false
    change_kouho.each do |a,b,c|
        jibun += turn ? b : a
        teki += turn ? a : b
        turn = !turn
    end

    son_kouho.each do |a,b,c|
        jibun += turn ? b : a
        teki += turn ? a : b
    end
    [jibun, teki, !turn]
end

res = resolve(1)
puts res[0]