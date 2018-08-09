STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# w: width of the building.
# h: height of the building.
@w, @h = gets.split(" ").collect {|x| x.to_i}
@n = gets.to_i # maximum number of turns before game over.
@x0, @y0 = gets.split(" ").collect {|x| x.to_i}
@now_hash = { x:@x0, y:@y0 }
@check_hash = { xl:0, xr:@w, yu:0, yd:@h }

def how_move(big, small)
    
    ((big - small)/2)
    
end


# game loop
loop do

    bomb_dir = gets.chomp # the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    # Write an action using puts
    # To debug: STDERR.puts "Debug messages..."
    if bomb_dir.index('U') 
        @check_hash[:yd] = @now_hash[:y] - 1
        expectation = 0 < @check_hash[:yu] ? @check_hash[:yu]  : 0
        @now_hash[:y] -= how_move( @now_hash[:y], expectation - 1 ) 
    elsif bomb_dir.index('D')
        @check_hash[:yu] = @now_hash[:y] + 1
        expectation = @check_hash[:yd] < @h ? @check_hash[:yd] : @h
        @now_hash[:y] += how_move( expectation + 1, @now_hash[:y] )
    end
    
    if bomb_dir.index('L') 
        @check_hash[:xr] = @now_hash[:x] - 1
        expectation = 0 < @check_hash[:xl] ? @check_hash[:xl]  : 0
        @now_hash[:x] -= how_move( @now_hash[:x], expectation - 1)
    elsif  bomb_dir.index('R')
        @check_hash[:xl] = @now_hash[:x] + 1
        expectation = @check_hash[:xr] < @w ? @check_hash[:xr] : @w
        @now_hash[:x] += how_move( expectation + 1, @now_hash[:x])
    end

    # the location of the next window Batman should jump to.
    puts "#{@now_hash[:x]} #{@now_hash[:y]}"
    
end