N, M = gets.split.map(&:to_i)
pcf = []
N.times do 
    a,b,*c = gets.split.map(&:to_i)
    pcf.push([a,b,c])
end

pcf.sort!

N.times do |i|
    pi, ci, fi = pcf[i]
    i.times do |j|
        pj, cj, fj = pcf[j]
        if pj == pi
            if (fj - fi).size > 0 && (fi- fj).size == 0
                puts 'Yes'
                exit
            elsif (fi -fj).size > 0 && (fj - fi).size == 0
                puts 'Yes'
                exit
            end
        elsif pj < pi
            if (fj - fi).size >= 0 && (fi -fj).size == 0
                puts 'Yes'
                exit
            end
        else
            raise
        end
    end
end

puts 'No'