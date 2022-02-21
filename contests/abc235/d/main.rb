A , N = gets.split.map(&:to_i)

queue = [[1, 0]]
done = {}
done[1] = 0

while(q, cnt = queue.shift) do
  nx1 = q * A
  if !done[nx1] && nx1 < 10**6
    done[nx1] = cnt + 1
    queue.push([nx1, cnt+1])
  end

  if q >= 10 && (q % 10) != 0
    nx2 = ((q % 10).to_s + (q / 10).to_s).to_i
    if !done[nx2] && nx2 < 10**6
      done[nx2] = cnt + 1
      queue.push([nx2, cnt+1])
    end
  end
  if done[N]
    puts done[N]
    exit
  end
end

puts -1