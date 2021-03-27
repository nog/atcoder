T = gets.to_i

T.times do
    ax, ay, ap, aq = gets.split.map(&:to_y)
    max = (2*(ax+ay)).lcm(ap, aq)
    n  = 0
    n2 = 0
    maxn = max / (ap + aq)
    while(n <= maxn) do

        okite_min = (ap+aq) * n + ap
        okite_max = (ap+aq) * (n+1)
        n += 1
        next if okite_max < ax


        n2_min = ((okite_min - ax).to_f / (2 * (ax + ay))).ceil
    end
end