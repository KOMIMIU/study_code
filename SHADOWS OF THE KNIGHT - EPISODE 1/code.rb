STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
@w, @h = gets.split(" ").collect {|x| x.to_i}
@n = gets.to_i # maximum number of turns before game over.
@x0, @y0 = gets.split(" ").collect {|x| x.to_i}
@here = { x:@x0, y:@y0 }
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
        @limits[:bottom] = @here[:y]
        bottom = 0 < @limits[:top] ? @limits[:top] : 0
        @here[:y] -= moving( @here[:y], bottom ) 
    
    elsif bomb_dir.index('D')
        @limits[:top] = @here[:y]
        top = @limits[:bottom] < @h ? @limits[:bottom] : @h
        @here[:y] += moving( top, @here[:y] )
    end
    
    if bomb_dir.index('L') 
        @limits[:riightmost] = @here[:x]
        leftmost = 0 < @limits[:leftmost] ? @limits[:leftmost]  : 0
        @here[:x] -= moving( @here[:x], leftmost)
    
    elsif bomb_dir.index('R')
        @limits[:leftmost] = @here[:x]
        rightmost = @limits[:riightmost] < @w ? @limits[:riightmost] : @w
        @here[:x] += moving( rightmost, @here[:x])
    end

    # the location of the next window Batman should jump to.
    puts "#{@here[:x]} #{@here[:y]}"
    
end