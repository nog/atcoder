H, W = gets.split.map(&:to_i)
S = []
H.times do 
  S.push(gets.split(''))
end

R = "snuke"

dir = [[-1,0], [-1, 1], [1,0], [1,1], [0,1], [1,-1], [0,-1], [-1,-1]]

H.times do |h|
  W.times do |w|
    next unless S[h][w] == R[0]
    dir.each do |dx, dy|
      list = []
      res = true
      5.times do |i|
        y = h + (dy * i)
        x = w + (dx * i)

        if y < 0 || x < 0 || x >= W || y >= H
          res = false
          break
        end
        if S[y][x] != R[i]
          res = false
          break
        end
        list.push([y,x])
      end
      if res
        puts list.map{|a,b| "#{a+1} #{b+1}"}.join("\n")
        exit
      end
    end
  end
end