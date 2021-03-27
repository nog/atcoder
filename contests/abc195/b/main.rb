A, B, W = gets.split.map(&:to_i)

# UNSATISFIABLE 
w = W * 1000
min = (w.to_f / B).ceil
ave = w / min
if ave < A || B < ave
    puts "UNSATISFIABLE"
    exit
end

max = (w / A)
ave = w / max
if ave < A || B < ave
    puts "UNSATISFIABLE"
    exit
end



puts "#{min} #{max}"