X, Y = gets.split.map(&:to_i)

x = X
cache = {}
result = 0

cache[x] = true
if x == Y
    puts 0
    exit
end

if x > Y
    puts x - Y
    exit
end

queue = [[x, 0]]
result = 10**10
while(num, cnt = queue.shift)  do 
    ncnt = cnt + 1
    if ncnt >= result
        puts result
        exit
    end
    kouho = (3 * num >= Y) ? [num+1, num-1, 2*num] : [2*num]
    kouho.each do |nnum|
        next if cache[nnum]
        if nnum == Y
            puts ncnt
            exit
        elsif nnum > Y
            nresult = ncnt + nnum - Y
            if nresult < result
                result = nresult
            end
        else
            queue.push([nnum, ncnt])
        end
        cache[nnum] = true
    end
end
