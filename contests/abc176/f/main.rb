N = gets.to_i
A = gets.split.map(&:to_i)

dp = Array.new(N){ {} }

dp[0][A[0]] = { A[1] => 0 }
dp[0][A[1]] = { A[0] => 0 }

base = 0
(N-1).times do |i|
    c1, c2, c3 = *[A[3*i+2], A[3*i+3], A[3*i+4]].sort
    if c1 == c3
        base += 1
        dp[i+1] = dp[i]
        next
    end
    if c1 == c2 || c2 == c3
        nokori = c1 + c3 - c2
        if dp[i][c2]
            dp[i][c2].each do |k, v|
                dp[i+1][k][nokori] = v + 1
            end
        end
        if dp[i].dig(nokori, nokori)
            dp[i+1][c2] = {
                c2 => dp[i][nokori][nokori] + 1
            }
        end
        next
    end
    if dp[i].dig(c1,c1) || dp[i].dig(c2,c2) || dp[i].dig(c3,c3)
        if v = dp[i].dig(c1,c1)
            dp[i+1][c2] = {
                c3 => v+1
            }
            dp[i+1][c3] = {
                c2 => v+1
            }
        end
        if v = dp[i].dig(c2,c2)
            dp[i+1][c1] = {
                c3 => v+1
            }
            dp[i+1][c2] = {
                c1 => v+1
            }
        end
        if v = dp[i].dig(c3,c3)
            dp[i+1][c1] = {
                c2 => v+1
            }
            dp[i+1][c2] = {
                c1 => v+1
            }
        end
    else
        dp[i+1] = dp[i]
    end
end