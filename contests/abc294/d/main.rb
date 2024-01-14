N , Q = gets.split.map(&:to_i)

min = 0
done = {}
done_min = 0
Q.times do 
  e, x = gets.split.map(&:to_i)
  if e == 1
    min += 1
  elsif e == 2
    done[x] = true
  elsif e == 3
    while(done[done_min+1]) do
      done_min += 1
    end
    puts done_min+1
  else
    raise
  end
end