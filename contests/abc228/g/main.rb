H, W, N = gets.split.map(&:to_i)
C = Array.new H
H.times do |i|
  C[i] = gets.chomp.split('').map(&:to_i)
end

CX = C.transpose
queue = []
H.times do |h|
  W.times do |w|
    queue.push([h,w,N,])
  end
end