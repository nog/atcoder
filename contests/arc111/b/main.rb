N = gets.to_i

@kakutei = {}
@result = 0

@pairs = []
cnt = N

@counts = Hash.new 0

N.times do |i|
    a, b = gets.split.map(&:to_i)
    if a == b
        unless @kakutei[a]
            @kakutei[a] = true
            @result += 1
        end
    else
        if @kakutei[a]
            unless @kakutei[b]
                @kakutei[b] = true
                @result += 1
            end
        elsif @kakutei[b]
            @kakutei[a] = true
            @result += 1
        else
            @counts[a] += 1
            @counts[b] += 1
            @pairs.push([a,b])
        end
    end
end

def kakuteisyori
    loop do
        new_counts = Hash.new 0
        cnt = @pairs.size
        @pairs = @pairs.find_all do |a, b|
            if @kakutei[a]
                unless @kakutei[b]
                    @kakutei[b] = true
                    @result += 1
                end
                false
            elsif @kakutei[b]
                @kakutei[a] = true
                @result += 1
                false
            elsif @counts[a] == 1
                @kakutei[a] = true
                @result +=1
                false
            elsif @counts[b] == 1
                @kakutei[b] = true 
                @result += 1
                false
            else
                new_counts[a] += 1
                new_counts[b] += 1
                true
            end
        end
        @counts = new_counts
        break if cnt == @pairs.size
    end
end

def mikakuteisyori
    pair = @pairs.shift
    return unless pair
    @kakutei[pair[0]] = true
    @result += 1
end

while @pairs.size > 0 do
    kakuteisyori
    mikakuteisyori
end

puts @result