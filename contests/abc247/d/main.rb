Q = gets.to_i
q1 = []
Q.times do 
  query = gets.split.map(&:to_i)
  if query[0] == 1
    q1.push([query[1], query[2]])
  else
    cnts = query[1]
    res = 0
    while(cnts > 0) do
      if cnts >= q1[0][1]
        x, c = q1.shift
        res += x * c
        cnts -= c
      else
        res += (q1[0][0] * cnts)
        q1[0][1] -= cnts
        break
      end
    end
    puts res
  end
end