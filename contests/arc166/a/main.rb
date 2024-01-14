T = gets.to_i
T.times do
    n, x, y = gets.chomp.split
    n = n.to_i
    x = x.split('')
    y = y.split('')

    res = true

    xac = [0]
    xacl = 0
    yac = [0]
    yacl = 0
    xbc = [0]
    xbcl = 0
    ybc = [0]
    ybcl = 0
    xcc = [0]
    xccl = 0
    byci = 0
    n.times do |i|
        yc = y[i]
        xc = x[i]
        if yc == 'C'
            if xc != 'C'
                res = false
                break
            end
            i.downto(byci) do |j|
                if (xacl - xac[j]) > (yacl - yac[j])
                    res = false
                    break
                end
            end
            break unless res
            byci = i
        else
            if yc == 'A'
                yacl += 1
            elsif yc == 'B'
                ybcl += 1
            else
                raise
            end
            if xc == 'A'
                xacl += 1
            elsif xc == 'B'
                xbcl += 1
            else
                xccl += 1
            end
        end
        xac.push(xacl)
        yac.push(yacl)
        xbc.push(xbcl)
        ybc.push(ybcl)
        xcc.push(xccl)
        if xbcl - xbc[byci] > ybcl - ybc[byci]
            res = false
            break
        end
    end
    if res
        if xbcl - xbc[byci] > ybcl - ybc[byci]
            res = false
        end
    end
    if res
      (n-1).downto(byci) do |j|
          if (xacl - xac[j]) > (yacl - yac[j])
              res = false
              break
          end
      end
    end
    puts res ? "Yes" : 'No'
end