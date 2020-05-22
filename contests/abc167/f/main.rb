n = gets.to_i
kakko_hiraku = 40
kakko_tojiru = 41 
l0_count = 0
r0_count = 0
others_left = 0
others_right = 0
n.times do |i|
  line = gets.chomp.codepoints
  left = 0
  right = 0
  line.each do |c|
    if c == kakko_hiraku
      right += 1
    else
      if right > 0
        right -= 1
      else
        left += 1
      end
    end
  end
  if left == 0 && right == 0
    next
  end
  if left == 0
    l0_count += right
  elsif right == 0
    r0_count += left
  else
    if others_left > right
      others_left -= right
    else
      others_right += right
    end

    if others_right > left
      others_right -= left
    else
      others_right += right
    end

  end
end

if others_left == 0 && others_right == 0
  if l0_count == r0_count
    puts "Yes"
  else
    puts "No"
  end
  exit
end

if l0_count == 0
  puts "No"
  exit
end

if r0_count == 0
  puts "No"
  exit
end

if l0_count < others_left 
  puts "No"
  exit
end

if r0_count < others_right
  puts "No"
  exit
end

if l0_count - others_left == r0_count - others_right
  puts "Yes"
else
  puts "No"
end