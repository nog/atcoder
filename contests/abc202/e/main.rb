N = gets.to_i
P = gets.split.map(&:to_i)
Q = gets.to_i

@tree = { }
P.each.with_index do |po, i|
    ii = i + 2
    @tree[po] ||= []
    @tree[po].push(ii)
end

@dists = Array.new N+1
@dists[0] = 0
@dists[1] = 0

@dist_map = {
}

#queue = [*@tree[1].dup]
#while(q = queue.shift) do
#    d = @dists[P[q-2]] + 1
#    @dists[q] = d
#    dist_map[d] ||= []
#    dist_map[d].push(q)
#    queue.push(*@tree[q])
#end

@in_list = Array.new N+1
@out_list = Array.new N+1

@count = 0
def dfs point, d
    @in_list[point] = @count
    @dists[point] = d
    @dist_map[d] ||= []
    @dist_map[d].push(point)
    if @tree[point]
        @tree[point].each do |ne|
            @count+= 1
            dfs(ne, d+1)
        end
    end
    @count +=1
    @out_list[point] = @count
end

dfs(1, 0)

# warn @in_list.inspect
# warn @out_list.inspect
# warn @dist_map.inspect
# warn @dists.inspect

Q.times do 
    u, d = gets.split.map(&:to_i)
    uin = @in_list[u]
    uout = @out_list[u]
    ud = @dists[u]

    if ud > d
        puts 0
        next
    end

    if ud == d
        puts 1
        next
    end

    unless @dist_map[d]
        puts 0
        next
    end

    result = 0
    points = @dist_map[d]
    # warn points.inspect
    inpoint = points.bsearch_index do |po|
        @in_list[po] > uin
    end
    outpoint = points.bsearch_index do |po|
        @out_list[po] >= uout
    end
    # warn "inpoint:#{inpoint} outpoint:#{outpoint}"
    unless inpoint
        puts 0
        next
    end

    unless outpoint
        puts points.size - inpoint
        next
    end
    puts outpoint - inpoint
end