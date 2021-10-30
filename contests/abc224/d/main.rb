M = gets.to_i
require 'timeout'
begin
  Timeout.timeout(3.9) do
    
    routes = Array.new(10){ [] }
    M.times do
      u, v = gets.split.map(&:to_i)
      routes[u].push(v)
      routes[v].push(u)
    end

    haichi = gets.split.map(&:to_i)

    ihaichi = ("9" + haichi.join('')).to_i

    kara = (45 - haichi.sum)
    goal = 9012345679
    done = {}

    xhaichi = Array.new 10
    8.times do |i|
      pos = haichi[i]
      xhaichi[pos] = i
    end
    xhaichi[kara] = 9
    # warn xhaichi.inspect
    # warn ("9" + xhaichi.join('')).to_i
    xkey = ("9" + xhaichi.join('')).to_i


    queue = [[xkey, kara, 0]]
    while(haichi, kara, cnt = queue.shift) do
      next if done[haichi]
      if haichi == goal
        puts cnt
        exit
      end
      done[haichi] = true
      ncnt = cnt + 1
      routes[kara].each do |nkara|
        nhaichi = haichi.to_s
        nhaichi[kara] = nhaichi[nkara]
        nhaichi[nkara] = "9"
        key = nhaichi.to_i
        # warn "haichi: #{haichi} -> #{nhaichi} kara:#{kara} nkara:#{nkara}"
        # warn key
        # warn "--"
        next if done[key]
        queue.push([key, nkara, ncnt])
      end
    end

    puts -1
  end
rescue => exception
  puts -1
end