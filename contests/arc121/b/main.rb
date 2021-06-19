N = gets.to_i

PETS = Array.new(2 * N)

R_PETS = []
G_PETS = []
B_PETS = []
ALL_LIST = []
(2*N).times do |i|
    a, c = gets.chomp.split
    # ALL_LIST.push([a, c])
    a = a.to_i
    if c == 'R'
        R_PETS.push(a)
    elsif c == 'G'
        G_PETS.push(a)
    elsif c == 'B'
        B_PETS.push(a)
    else
        raise
    end
end

if R_PETS.size.even? && G_PETS.size.even? && B_PETS.size.even?
    puts 0
    exit
end
R_PETS.sort!
G_PETS.sort!
B_PETS.sort!

even_list = nil
odd_list_a = nil
odd_list_b = nil
if R_PETS.size.even?
    even_list = R_PETS
    odd_list_a = G_PETS
    odd_list_b = B_PETS
elsif G_PETS.size.even?
    even_list = G_PETS
    odd_list_a = R_PETS
    odd_list_b = B_PETS
elsif B_PETS.size.even?
    even_list = B_PETS
    odd_list_a = R_PETS
    odd_list_b = G_PETS
end

a = odd_list_a[0]
ai = 0
b = odd_list_b[0]
bi = 0
result = (a-b).abs
while(a && b) do
    if(a<b)
        ai += 1
        a = odd_list_a[ai]
    else
        bi += 1
        b = odd_list_b[bi]
    end
    break if !a || !b
    r = (a-b).abs
    result = r if r < result
end

even_size = even_list.size
if even_size == 0
    puts result
    exit
end

a_size = odd_list_a.size
ai = 0
a_first = nil
a_first_i = nil
a_second = nil
a_second_i = nil
bi = 0
b_first = nil
b_first_i = nil
b_second = nil
b_second_i = nil

even_size.times do |i|
    e = even_list[i]
    while(a = odd_list_a[ai+1] && a < e)
        ai += 1
    end
    while(b = odd_list_b[bi+1] && b < e)
        bi += 1
    ene

    if odd_list_a[ai]
        ar = (e - odd_list_a[ai]).abs
        ar = a ? [ar, a-e].min : ar

        if !a_first || ar < a_first 
            a_second = a_first
            a_second_i = a_first_i

            a_first = ar
            a_first_i = i
        elsif !a_second || ar < a_second
            a_second = ar
            a_second_i = i
        end
        ai+=1
    end

    if odd_list_b[bi]
        br = (e - odd_list_b[bi]).abs
        br = b ? [br, (b-e)].min : br

        if !b_first || br < b_first
            b_second = b_first
            b_second_i = b_first_i

            b_first = br
            b_first_i = i
        elsif !b_second || br < b_second
            b_second = br
            b_second_i = i
        end
        bi+=1
    end
end


kouho = [result]
warn a_first
warn b_first
if a_first_i != b_first_i
    kouho.push(a_first + b_first)
else
    kouho.push(a_first + b_second) if b_second
    kouho.push(a_second + b_first) if a_second
end

puts kouho.min