function [r,c,o] = locationTester(boatLength,board_display)
% generates random coordiantes to place boat

% 

loop = 0;
if boatLength == 5                              % if we need a boat 5 long
    o = randi(2);                               % generate random orientation
    if o == 1                                   % if orientation is horizontal
        while loop==0
            r = randi(10);
            c = randi(6)+13;
            if board_display(r,c-2) == 2 && board_display(r,c-1) == 2 && board_display(r,c) == 2 && board_display(r,c+1) == 2 && board_display(r,c+2) == 2 % if all segments of the boat horizontally are water
                loop = 1;
            end
        end

    elseif o == 2                               % if orientation is vertical
        while loop == 0
            r = randi(6)+2;
            c = randi(10)+11;
            if board_display(r-2,c)==2 && board_display(r-1,c)==2 && board_display(r,c)==2 && board_display(r+1,c)==2 && board_display(r+2,c)==2 % if all segments of the boat vertically are water
                loop = 1;
            end
        end
    end



elseif boatLength == 4                            % if we need a boat 4 long
    o = randi(2);
    if o == 1                                     % if orientation is horizontal
        while loop == 0                           
            r = randi(10);
            c = randi(7)+13;
            if board_display(r,c) == 2 && board_display(r,c-2) == 2 && board_display(r,c-1) == 2 && board_display(r,c+1) == 2 % if all segments of the boat horizontally are water
                loop=1;
            end
        end
    elseif o == 2                                  % if orientation is vertical
        while loop == 0
            r = randi(7)+2;
            c = randi(10)+11;
            if board_display(r-2,c) == 2 && board_display(r-1,c) == 2 && board_display(r,c) == 2 && board_display(r+1,c) == 2 % if all segments of the boat vertically are water
                loop=1;
            end
        end
    end

    
elseif boatLength == 3                          % if we need a boat 3 long
    o = randi(2);
    if o == 1                                   % if orientation is horizontal
        while loop == 0
            r = randi(10);
            c = randi(8)+12;
            if board_display(r,c-1) == 2 && board_display(r,c) ==2 && board_display(r,c+1) == 2 % if all segments of the boat horizontally are water
                loop=1;
            end
        end
    elseif o == 2                               % if orientation is vertical
        while loop == 0
            r = randi(8)+1;
            c = randi(10)+11;
            if board_display(r-1,c) == 2 && board_display(r,c) ==2 && board_display(r+1,c)==2 % if all segments of the boat vertically are water
                loop=1;
            end
        end
    end




elseif boatLength ==2                           % if we need a boat 2 long
    o = randi(2);
    if o == 1                                   % if orientation is horizontal
        while loop == 0
            r = randi(10);
            c = randi(9)+11;
            if board_display(r,c+1) == 2  && board_display(r,c) == 2 && board_display(r,c-1) ==2 % if all segments of the boat horizontally are water
                loop=1;
            end
        end
    elseif o == 2                               % if orientation is vertical
        while loop == 0
            r = randi(9);
            c = randi(10)+11;
            if board_display(r,c) == 2 && board_display(r+1,c) == 2 % if all segments of the boat vertically are water
                loop=1;
            end

        end
    end
end