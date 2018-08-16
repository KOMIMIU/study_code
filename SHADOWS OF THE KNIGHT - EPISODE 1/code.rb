STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
@w, @h = gets.split(" ").collect {|x| x.to_i}
@n = gets.to_i # maximum number of turns before game over.
@x0, @y0 = gets.split(" ").collect {|x| x.to_i}
@current_location = { x:@x0, y:@y0 }
@limits = { leftmost:0, riightmost:@w, top:0, bottom:@h }

def moving(max, min)
    
    #roundup
    (max - min)/2 + (max - min)%2
    
end

# game loop
loop do

    bomb_dir = gets.chomp # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    # Write an action using puts
    # To debug: STDERR.puts "Debug messages..."
    if bomb_dir.index('U') 
        @limits[:bottom] = @current_location[:y]
        bottom = 0 < @limits[:top] ? @limits[:top] : 0
        @current_location[:y] -= moving( @current_location[:y], bottom ) 
    
    elsif bomb_dir.index('D')
        @limits[:top] = @current_location[:y]
        top = @limits[:bottom] < @h ? @limits[:bottom] : @h
        @current_location[:y] += moving( top, @current_location[:y] )
    end
    
    if bomb_dir.index('L') 
        @limits[:riightmost] = @current_location[:x]
        leftmost = 0 < @limits[:leftmost] ? @limits[:leftmost]  : 0
        @current_location[:x] -= moving( @current_location[:x], leftmost)
    
    elsif bomb_dir.index('R')
        @limits[:leftmost] = @current_location[:x]
        rightmost = @limits[:riightmost] < @w ? @limits[:riightmost] : @w
        @current_location[:x] += moving( rightmost, @current_location[:x])
    end

    # the location of the next window Batman should jump to.
    puts "#{@current_location[:x]} #{@current_location[:y]}"
    
end