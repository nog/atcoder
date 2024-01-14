H, W = gets.split.map(&:to_i)

C = Array.new(H)
H.times do |i|
    C[i] = gets.chomp.split('')
end

TC = C.transpose

l = true
delh = {}
delhsize = 0
delw = {}
delwsize = 0
hlist = (0...H).to_a
wlist = (0...W).to_a
while(l) do
    l = false
    adh = []
    adw = []
    if delwsize + 1 < W
        hlist.each.with_index do |h, i|
            ch = C[h]
            c = nil
            e = true
            wlist.each do |w|
                c ||= ch[w]
                if c != ch[w]
                    e = false
                    break
                end
            end
            if e
                adh.push(i)
            end
        end
    end
    if delhsize + 1 < H
        wlist.each.with_index do |w,i|
            cw = TC[w]
            c = nil
            e = true
            hlist.each do |h|
                c ||= cw[h]
                if c != cw[h]
                    e = false
                    break
                end
            end
            if e
                adw.push(i)
            end
        end
    end
    adh.reverse.each do |h|
        hlist.delete_at(h)
        delhsize += 1
        l = true
    end
    adw.reverse.each do |w|
        wlist.delete_at(w)
        delwsize += 1
        l = true
    end
    # warn delh.inspect
    # warn delw.inspect
end

puts (H - delhsize) * (W - delwsize)