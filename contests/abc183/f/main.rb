N, Q = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
@hash = {}
C.each_with_index do |c, i|
    @hash[i+1] = { :sum => {c => 1}, :list => [] }
end

def get_parent x
    hx = @hash[x]
    while(!hx[:parent]) do
        parent = hx[:parent]
        hx = @hash[parent]
    end
    if pare
        return hx[:parent] = get_parent(pare)
    else
        x
    end
end

def get_list x
    res = @hash[x][:list].dup
    @hash[x][:list].each do |l|
        res.push(*get_list(l))
    end
    res
end


Q.times do |i|
    type, a, b = gets.split.map(&:to_i)
    if type == 1
        a = get_parent(a)
        b = get_parent(b)
        if a != b
          @hash[a][:sum].merge!(@hash[b][:sum]) do |k, v1, v2|
            v1 + v2
          end
          @hash[b][:parent] = a
        end

    elsif type == 2
        a = get_parent(a)
        puts @hash[a][:sum][b] || 0
    else
        raise
    end
end