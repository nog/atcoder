N, M = gets.split.map(&:to_i)

@result = []

def calc cur=[]
  # warn cur.inspect
  if cur.size == 0
    1.upto(M-N+1) do |i|
      cur.push(i)
      if N == 1
        @result.push(cur.dup)
      end
      calc(cur)
      cur.pop
    end
  else
    last = cur[-1]
    size = cur.size
    # warn "last:#{last}"
    max = M-N+size+1
    # warn "max:#{max}"
    if max > M
      max = M
    end
    (last+1).upto(max) do |i|
      cur.push(i)
      if size == N-1
        @result.push(cur.dup)
      else
        calc(cur)
      end
      cur.pop
    end
  end
end

calc 

@result.each do |l|
  puts l.join(' ')
end