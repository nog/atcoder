T = gets.to_i

T.times do
  n = gets.to_i
  ns = n.to_s(2)
  cnt = ns.count('1')
  if n < 7
    puts -1
    next
  end
  if cnt == 3
    puts n
    next
  end
  if cnt > 3
    c = 0
    ns.length.times do |i|
      if ns[i] == "1"
        c += 1
        if c > 3
          ns[i] = "0"
        end
      end
    end
    puts ns.to_i(2)
    next
  end
  if cnt == 1
    puts ("111" + ("0" * (ns.length - 4))).to_i(2)
    next
  end
  if cnt == 2
    pos = nil
    1.upto((ns.length) - 1) do |i|
      if ns[i] == "1"
        pos = i
        break
      end
    end
    list = []
    list.push(("111" + ("0" * (ns.length - 4))).to_i(2))
    if ns[pos + 2]
      ns[pos] = "0"
      ns[pos+1] = "1"
      ns[pos+2] = "1"
      list.push(ns.to_i(2))
    end
    puts list.max
    next
  end
  raise
end