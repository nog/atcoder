N, M = gets.split.map(&:to_i)

A = []
wins = []
(2*N).times do |i|
  A.push(gets.split(''))
  wins.push([0, i])
end


M.times do |m|
  wins.sort!
  N.times do |i|
    a = wins[2*i]
    b = wins[2*i+1]

    an = a[1]
    bn = b[1]
    ahand = A[an][m]
    bhand = A[bn][m]

    win = nil
    if ahand == 'G'
      if bhand == 'C'
        win = true
      elsif bhand == 'P'
        win = false
      end
    elsif ahand == 'C'
      if bhand == 'P'
        win = true
      elsif bhand == 'G'
        win = false
      end
    elsif ahand == 'P'
      if bhand == 'G'
        win = true
      elsif bhand == 'C'
        win = false
      end
    else
      warn ahand
      raise
    end

    if win == true
      a[0] -= 1
    elsif win == false
      b[0] -= 1
    end
  end
end

wins.sort.each do |w|
  puts w[1] + 1
end