octopus = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh']
def sluggish(octopus)
    result = ""
    octopus.each do |ele1|
        octopus.each do |ele2|
            if ele1.length > result.length
                result = ele1
            elsif ele2.length > result.length
                result = ele2
            end
        end
    end
    return result
end

p sluggish(octopus)

def dominant(octopus)
    result = octopus.sort_by{|ele| ele.length}
    return result[-1]
end

p dominant(octopus)

def clever(octopus)
    length = 0
    longest = ""
    octopus.each do |ele|
        if ele.length > length
            length = ele.length
            longest = ele
        end
    end
    return longest
end

p clever(octopus)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
    tiles.each_with_index do |ele, i|
        return i if ele == direction
    end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

new_tiles_data_structure = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(direction, tiles)
    return tiles[direction]
end

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)