H, W = gets.split.map(&:to_i)
MAX = H*W
Ch, Cw = gets.split.map(&:to_i)
Dh, Dw = gets.split.map(&:to_i)
S = Array.new H + 4
S[0] = Array.new(W+4, nil)
S[1] = Array.new(W+4, nil)
H.times do |i|
    S[i+2] = [nil,nil, *gets.chomp.split('').map{|x| x == "#" ? nil : MAX}, nil, nil]
end
S[H+2] = Array.new(W+4, nil)
S[H+3] = Array.new(W+4, nil)

res = 0

fillq = [[Ch+1, Cw+1, 0]]
S[Ch+1][Cw+1] = 0
warpq = []

dlist = [
    [-1,0],
    [+1,0],
    [0,-1],
    [0,+1]
]
wdlist = [
    [-2,-2],
    [-2,-1],
    [-2,0],
    [-2,+1],
    [-2,+2],
    [-1,-2],
    [-1,-1],
    [-1,+1],
    [-1,+2],
    [0,-2],
    [0,+2],
    [+1,-2],
    [+1,-1],
    [+1,+1],
    [+1,+2],
    [+2,-2],
    [+2,-1],
    [+2,0],
    [+2,+1],
    [+2,+2]
]

while fillq[0] || warpq[0] do
    while(fq = fillq.shift) do
        h, w, d = *fq
        if h == Dh+1 && w == Dw+1
            puts d
            exit
        end
        dlist.each do |dh, dw|
            t = S[_h=h+dh][_w=w+dw]
            if t && d < t
                fillq.push([_h,_w,d])
                S[_h][_w] = d
            end
        end
        warpq.push([h,w,d+1])
    end

    while wq = warpq.shift
        h,w,d = *wq
        list = []
        wdlist.each do |dh,dw|
            t = S[_h=h+dh][_w=w+dw]
            if  t && d < t
                S[_h][_w] = d
                fillq.push([_h,_w,d])
            end
        end
    end
end

puts -1