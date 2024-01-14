C = []
3.times do
    C.push(gets.split.map(&:to_i))
end

size = 362880
gakkari = 0

(0..8).to_a.permutation.each do |list|
    map = [
        [nil,nil,nil],[nil,nil,nil],[nil,nil,nil]
    ]
    ga = false
    list.each do |k|
        x = k % 3
        y = k / 3
        c = C[y][x]
        map[y][x] = c
        map0 = map[0]
        map1 = map[1]
        map2 = map[2]

        templist = [
            map[y],
            [map0[x], map1[x], map2[x]],
        ]
        if x == y
            templist.push([map0[0], map1[1], map2[2]])
        end
        if 2-x == y
            templist.push([map2[0], map1[1], map0[2]])
        end

        templist.each do |temp|
            if temp.compact.size == 2 && temp.uniq.size == 2
                ga = true
                break
            end
        end
        break if ga
    end
    gakkari += 1 if ga
end

puts 1.0 - (gakkari.to_f / size)