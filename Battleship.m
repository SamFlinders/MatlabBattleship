close
clc
clear
loopgame=1;
while loopgame==1 % loop to let the game loop
close all
clc
clear
loopgame=1;

    % close all
    titlescn=simpleGameEngine('titlescreenblue.png',84,84);

    % Title Screen Code

    board_display = 20*ones(9,15);  % creates the title screen

    board_display(2,6) = 1;
    board_display(2,7) = 2;
    board_display(2,8) = 3;
    board_display(2,9) = 4;
    board_display(2,10) = 5;        % 'BATTLESHIP'

    board_display(3,7)= 6;
    board_display(3,8)=7;           % 'DIFFICULTY:'

    board_display(4,2)=8;           % 'EASY'
    board_display(4,3)=13;          % Selection box

    board_display(4,5)=10;          % 'FAIR'
    board_display(4,6)=13;          % Selection box

    board_display(4,8)=9;           % 'SMART AI'
    board_display(4,9)=14;          % Selection box

    board_display(4,11)=11;
    board_display(4,12)=12;         % 'IMPOSSIBLE'
    board_display(4,13)=13;         % Selection box

    board_display(5,3)=17;          % baby emoji
    board_display(5,9)=16;          % robot emoji
    board_display(5,6)=22;
    board_display(5,13)=21;

    board_display(7,6)=18;
    board_display(7,7)=19;          % 'START'
    board_display(7,8)=15;          % start button
    drawScene(titlescn,board_display)

    % Code for selecting Difficulty

    d=2; % Default difficulty is smart ai
    loop=0;
    while loop==0 % sets up loop to allow player to repeatedly change difficulties
        [r,c,x]=getMouseInput(titlescn); % Gets mouse input
        if r==4&&c==3 % if player clicks easy difficulty box
            d=0; % sets difficulty to 0
            board_display(4,3)=14;  % Changes the color of the box to green

            board_display(4,6)=13;  % Changes the rest to black
            board_display(4,9)=13;  %
            board_display(4,13)=13; %
            drawScene(titlescn,board_display) % Displays scene

        elseif r==4&&c==6 % if player clicks fair difficulty
            d=1; % difficulty = 1
            board_display(4,3)=13; % Changes the rest to black
            board_display(4,6)=14; % Changes the color of the box to green
            board_display(4,9)=13; %
            board_display(4,13)=13;%
            drawScene(titlescn,board_display)

        elseif r==4&&c==9 % if player chooses smart ai difficulty
            d=2;          % difficulty = 2
            board_display(4,3)=13;
            board_display(4,6)=13;  % Changes the color of the box to green, the rest to black
            board_display(4,9)=14;
            board_display(4,13)=13;
            drawScene(titlescn,board_display)

        elseif r==4&&c==13 % if player chooses impossible difficulty
            d=3; % difficulty = 3
            board_display(4,3)=13;
            board_display(4,6)=13;
            board_display(4,9)=13;
            board_display(4,13)=14; % Changes the color of the box to green, the rest to black
            drawScene(titlescn,board_display)

        elseif r==7&&c==8   % if you click the start button
            loop =1;        % close the loop
        end
    end
    close                   % close title screen figure




    bs_scn = simpleGameEngine('Battleship.png',84,84); % creates scene using Battleship.png

    % blank_sprite = 1;
    % water_sprite = 2;
    % left_ship_sprite = 3;
    % horiz_ship_sprite = 4;
    % right_ship_sprite = 5;
    % top_ship_sprite = 6;
    % vert_ship_sprite = 7;
    % bot_ship_sprite = 8;
    % hit_sprite = 9;
    % miss_sprite = 10;
    % hidden_water = 11;

    board_display = 2 * ones(10,21); % creates game board 
    board_display(:,11) = 1;
    drawScene(bs_scn,board_display) % creates water tiles




    % Generating Ai Boat Locations
    length=5;
    [r,c,o]=locationTester(length,board_display);   % uses funtion locationTester to generate valid location for opponent ai

    if o == 1
        board_display(r,(c-2):(c+2))=11;
    elseif o==2
        board_display((r-2):(r+2),c)=11;
    end

    length = 4;
    [r,c,o]=locationTester(length,board_display);   % uses funtion locationTester to generate valid location for opponent ai

    if o == 1
        board_display(r,(c-2):(c+1))=11;
    elseif o == 2
        board_display((r-2):(r+1),c)=11;
    end

    length = 3;
    [r,c,o]=locationTester(length,board_display);   % uses funtion locationTester to generate valid location for opponent ai
    if o == 1
        board_display(r,(c-1):(c+1))=11;
    elseif o == 2
        board_display((r-1):(r+1),c)=11;
    end

    length = 3;
    [r,c,o]=locationTester(length,board_display);   % uses funtion locationTester to generate valid location for opponent ai
    if o == 1
        board_display(r,(c-1):(c+1))=11;
    elseif o == 2
        board_display((r-1):(r+1),c)=11;
    end

    length = 2;
    [r,c,o]=locationTester(length,board_display);   % uses funtion locationTester to generate valid location for opponent ai
    if o == 1
        board_display(r,(c-1):(c))=11;
    elseif o == 2
        board_display((r-1):(r),c)=11;
    end

    sum(board_display == 11,"all")


    % Player Places their 5 Long Boat

    [r,c,x] = getMouseInput(bs_scn);                % gets mouse input to place players 5 long boat
    loop=0;

    while loop==0

        if x == 1 && c <= 8 && c>=3 && board_display(r,c) == 2  % checks all segments are water horizontally
            %     [r,c] = getMouseInput(bs_scn);
            board_display(r,(c-2)) = 3;
            board_display(r,(c-1):(c+1)) = 4;
            board_display(r,c+2) = 5;
            drawScene(bs_scn,board_display)
            sub = [r,(c-1):(c+1)];
            loop = 1;
        elseif x == 3 && r <= 8 && r>=3 && board_display(r,c) == 2 % checks all segments are water vertically
            %     [r,c] = getMouseInput(bs_scn);
            board_display(r-2,c) = 6;
            board_display((r-1):(r+1),c) = 7;
            board_display(r+2,c) = 8;
            drawScene(bs_scn,board_display)
            loop = 1;
        else
            fprintf('Invalid Position, Try Again|n')
            [r,c,x] = getMouseInput(bs_scn);
        end
    end


    %Player places 4 long


    loop = 0;

    [r,c,x] = getMouseInput(bs_scn);    % gets mouse input to place players 4 long boat


    while loop==0

        if x == 1 && c <= 9 && c>=3 && board_display(r,c) == 2 && board_display(r,c-2) == 2 && board_display(r,c-1) == 2 && board_display(r,c+1) == 2 % checks all segments are water horizontally
            %     [r,c] = getMouseInput(bs_scn);
            board_display(r,(c-2)) = 3;
            board_display(r,(c-1):c) = 4;
            board_display(r,c+1) = 5;
            drawScene(bs_scn,board_display)
            sub = [r,(c-1):(c+1)];
            loop = 1;
        elseif (x == 3 && r <= 9 && r>=3 && board_display(r-2,c) == 2 && board_display(r-1,c) == 2 && board_display(r,c) == 2 && board_display(r+1,c) == 2) % checks all segments are water vertically
            %     [r,c] = getMouseInput(bs_scn);
            board_display(r-2,c) = 6;
            board_display((r-1):r,c) = 7;
            board_display(r+1,c) = 8;
            drawScene(bs_scn,board_display)
            loop = 1;
        else
            fprintf('Invalid Position, Try Again')
            [r,c,x] = getMouseInput(bs_scn);
        end
    end


    % Player 3 Long Boat # 1

    [r,c,x] = getMouseInput(bs_scn);    % gets mouse input to place players first 3 long boat
    loop=0;
    while loop == 0

        if x == 1 && c >= 2 && c <= 9 && board_display(r,c-1) == 2 && board_display(r,c) ==2 && board_display(r,c+1) == 2 % checks all segments are water horizontally

            board_display(r,(c-1)) = 3;
            board_display(r,c) = 4;
            board_display(r,c+1) = 5;
            drawScene(bs_scn,board_display)
            sub = [r,(c-1):(c+1)];
            loop=1;

        elseif x == 3 && r >= 2 && r <= 9 && board_display(r-1,c)==2 && board_display(r,c)==2 && board_display(r+1,c)==2 % checks all segments are water vertically

            board_display(r-1,(c)) = 6;
            board_display(r,c) = 7;
            board_display(r+1,c) = 8;
            drawScene(bs_scn,board_display)
            sub = [(r-1):(r+1),c];
            loop=1;

        else
            fprintf('Invalid Position, Try Again')
            [r,c,x] = getMouseInput(bs_scn);
        end
    end

    % 3 long boat #2

    [r,c,x] = getMouseInput(bs_scn);    % gets mouse input to place players second 3 long boat
    loop=0;
    while loop == 0

        if x == 1 && c >= 2 && c <= 9 && board_display(r,c-1) == 2 && board_display(r,c) ==2 && board_display(r,c+1) == 2 % checks all segments are water horizontally

            board_display(r,(c-1)) = 3;
            board_display(r,c) = 4;
            board_display(r,c+1) = 5;
            drawScene(bs_scn,board_display)
            sub = [r,(c-1):(c+1)];
            loop=1;

        elseif x == 3 && r >= 2 && r <= 9 && board_display(r-1,c)==2 && board_display(r,c)==2 && board_display(r+1,c)==2 % checks all segments are water vertically

            board_display(r-1,(c)) = 6;
            board_display(r,c) = 7;
            board_display(r+1,c) = 8;
            drawScene(bs_scn,board_display)
            sub = [(r-1):(r+1),c];
            loop=1;

        else
            fprintf('Invalid Position, Try Again')
            [r,c,x] = getMouseInput(bs_scn);
        end
    end

    %Player Places 2 Long Boat


    [r,c,x] = getMouseInput(bs_scn);    % gets mouse input to place players 2 long boat
    loop=0;
    while loop == 0

        if x == 1 && c >= 1 && c <= 9 && board_display(r,c+1) == 2  && board_display(r,c) == 2 && board_display(r,c) ==2 % checks all segments are water horizontally

            %     while c > 9
            %         fprintf('Invalid Position, Select a different location\n')
            %         [r,c] = getMouseInput(bs_scn);
            %     end

            board_display(r,(c)) = 3;
            board_display(r,c+1) = 5;
            drawScene(bs_scn,board_display) % draws scene
            loop=1; % ends loop

        elseif x == 3 && r >= 1 && r <= 9 && board_display(r,c) == 2 && board_display(r+1,c) == 2 % checks all segments are water vertically

            %     while r > 9
            %         fprintf('Invalid Position, Select a different location\n')
            %         [r,c,x] = getMouseInput(bs_scn);
            %     end

            board_display(r,(c)) = 6;
            board_display(r+1,c) = 8;
            drawScene(bs_scn,board_display) % draws scene
            loop=1; % ends loop

        else
            fprintf('Invalid Position, Try Again')
            [r,c,x] = getMouseInput(bs_scn);
        end
    end




    %  Player and cpu take turns attacking






    p1=0;
    cpu=0;
    f=0;
    t=1;
    while p1 < 17 && cpu < 17                               % while the player and cpu have made less than 17 hits
        l=0;

        [r,c] = getMouseInput(bs_scn);
        while c < 12                                        % makes sure player is clicking on the opponents side
            fprintf('You can''t attack your own side\n')    
            [r,c] = getMouseInput(bs_scn);
        end
        while board_display(r,c) == 10                      % checks if player already guessed that location and missed                                                 
            fprintf('You already tried that\n')
            [r,c] = getMouseInput(bs_scn);
        end
        while board_display(r,c) == 9                       % checks if player already guessed that location and hit it
            fprintf('You already hit that\n')
            [r,c] = getMouseInput(bs_scn);
        end
        if board_display(r,c) == 11                         % if player guesses somewhere an enemy ship is, mark it as a hit
            board_display(r,c) = 9;
            p1 = p1 + 1;                                    % add 1 to player hits
            drawScene(bs_scn,board_display)

        else
            board_display(r,c) = 10;                        % if player misses, mark it as a miss
            drawScene(bs_scn,board_display)
        end


        % cpu code

        r = randi(10);                                      % generate random coordinates to guess 
        c = randi(10);
        while l == 0                                        % whiles its the cpu's turn

            if d == 0                                       % if player chose easy difficulty
                b=0;

                while b==0
                    if board_display(r,c) ~= 2              % if the random coordinates are not water, generate new coordinates
                        r = randi(10);
                        c = randi(10);
                        b=1;
                        l=1;
                    else                                    % if it is water, guess there and mark it as a miss
                        board_display(r,c) = 10;
                        
                        drawScene(bs_scn,board_display)
                        b=1;
                        l=1;
                    end
                end
                l=1;
            end

            if d == 1                                       % if player chose fair difficulty
                b=0;
                while b==0
                    if board_display(r,c) == 10 |board_display(r,c) == 9    % if cpu already guessed there, try somewhere else
                        r = randi(10);
                        c = randi(10);
                    elseif board_display(r,c) == 2                          % if it guesses in water, mark as miss
                        board_display(r,c)=10;
                        drawScene(bs_scn,board_display)
                        l=1;
                        b=1;                                                % if it guesses on a boat , mark as hit and add 1 to cpu hit count
                    else
                        board_display(r,c) = 9;
                        drawScene(bs_scn,board_display)
                        cpu=cpu+1;
                        l=1;
                        b=1;
                    end
                end
            end

            if d ==2 % if player chose smart cpu difficulty
                b=0;
                failsafe=0; % creating failsafe so we don't get stuck in an infinite loop
                while b==0 % looping for turn
                    if failsafe >= 4
                        t=1;
                        failsafe=0;
                    elseif t==1 % phase 1
                        r1 = randi(10);
                        c1= randi(10); % random cooridnates
                        failsafe=0;
                        if board_display(r1,c1)==2 % if the random cords are water
                            board_display(r1,c1)=10;
                            drawScene(bs_scn,board_display) % display a miss
                            l=1; % end turn
                            b=1;
                        elseif board_display(r1,c1)==10 || board_display(r1,c1)==9 % if the cpu already guessed there, try somewhere else
                            r1 = randi(10);
                            c1= randi(10);
                        else % only other option is a hit
                            board_display(r1,c1)=9;
                            drawScene(bs_scn,board_display) %display a hit
                            cpu = cpu+1;
                            t=2; % move to phase 2 for next turn
                            l=1; % end turn
                            b=1;
                        end

                    elseif t==2 % phase 2

                        % 1=right 2=down 3=left 4=above
                        % creating code that will stop the cpu from guessing outside of the board
                        if c==1                 % if the hit is in the first column
                            o=randi(4);
                            while o==3          % generates a new location for the guess that is within the board
                                o=randi(4);
                            end
                        elseif r1==1
                            o=randi(3);         % generates a new location for the guess that is within the board
                        elseif r1==10            % if bottom row
                            o=randi(4);
                            while o==2
                                o=randi(4);     % generates a new location for the guess that is within the board
                            end
                        else
                            o=randi(4);
                        end
                        if r1==1&&c1==1           % if in top left corner
                            o=randi(2);         % generate guess below or right
                        elseif r1==1&&c1==10      % if in top right corner
                            o=randi(2)+1;       % generate guess below or left
                        elseif r1==10&&c1==1      % if in bottom left corner
                            while o==2|o==3
                                o=randi(4);     % keep generating until it is guessing above or right
                            end
                        elseif r1==10&&c1==10     % if in bottom right corner
                            o=randi(2)+2;       % generate guess above or left
                        end
                        b2=0;

                        while b2==0
                            if o==1 % guessing right first
                                if failsafe >=4
                                    b2=1;
                                    t=1;
                                end
                                if board_display(r1,c1+1)==2        % if it was a miss
                                    board_display(r1,c1+1)=10;      % display miss
                                    drawScene(bs_scn,board_display)
                                    l=1;                            % end turn
                                    b=1;
                                    b2=1;
                                elseif board_display(r1,c1+1)==10 |board_display(r1,c1+1)==9 |board_display(r1,c1+1)==1% if it already guessed that place
                                    if r1==10&&c1==1
                                        o=4;
                                    elseif r1==10&&c1==10
                                        o=3;
                                    elseif r1==10
                                        o=randi(4);
                                        while o==2
                                            o=randi(4);
                                        end

                                    else
                                        o=2;                                                      % guess below
                                        failsafe=failsafe+1;
                                    end
                                else                               % if it is a hit
                                    board_display(r1,c1+1)=9;      % display hit
                                    drawScene(bs_scn,board_display)
                                    cpu = cpu+1;
                                    c1=c1+1;                        % make there the next place to test
                                    l=1;                            % end turn
                                    b=1;
                                    b2=1;
                                end

                            elseif o==2                             % guessing below
                                if r1==10&&c1~=1
                                    o=3;
                                    break
                                elseif r1==10&&c1==1
                                    o=4;
                                    break
                                end

                                if board_display(r1+1,c1)==2        % if it was a miss
                                    board_display(r1+1,c1)=10;      % Display miss
                                    drawScene(bs_scn,board_display)
                                    l=1;                           % end turn
                                    b=1;
                                    b2=1;
                                elseif board_display(r1+1,c1)==10|board_display(r1+1,c1)==9    % if it was already guessed
                                    if r1==1&&c1==1
                                        o=1;
                                    elseif c1==1
                                        o=4;
                                    else
                                        o=3;                                                        % guess left
                                        failsafe=failsafe+1;
                                    end
                                elseif board_display(r1+1,c1)==1
                                else                           % if it was a hit
                                    board_display(r1+1,c1)=9;  % mark it as a hit
                                    drawScene(bs_scn,board_display)
                                    cpu = cpu+1;
                                    r1=r1+1;                    % make this new focus
                                    l=1;                        % end turn
                                    b=1;
                                    b2=1;
                                end
                            elseif o==3                             % guessing left
                                if c1==1&&r1==1
                                    o=1;
                                    break
                                elseif c1==1&&r1==10
                                    o=4;
                                    break
                                elseif c1==1
                                    o=4;
                                    break
                                end
                                if board_display(r1,c1-1)==2        % if it was a miss
                                    board_display(r1,c1-1)=10;      % display miss
                                    drawScene(bs_scn,board_display)
                                    l=1;                            % end turn
                                    b=1;
                                    b2=1;
                                elseif board_display(r1,c1-1)==10 |board_display(r1,c1-1)==9 % if it already guessed that place
                                    if r1==10
                                        o=1;
                                        f=1;
                                    else
                                        o=4;                                                      % guess above
                                        f=1;
                                        failsafe=failsafe+1;
                                    end
                                elseif board_display(r1,c1-1)==1    % if it is the center divider
                                else                                % if it is a hit
                                    board_display(r1,c1-1)=9;       % display hit
                                    drawScene(bs_scn,board_display)
                                    cpu = cpu+1;
                                    c1=c1-1;                        % make there the next place to test
                                    l=1;                            % end turn
                                    b=1;
                                    b2=1;
                                    f=1;
                                end

                            elseif o==4                             % guessing above
                                if r1==1&&c1==1
                                    o=1;
                                    break
                                elseif r1==1&&c1==10
                                    o=2;
                                    break
                                elseif r1==1
                                    o=1;
                                    break
                                end
                                if board_display(r1-1,c1)==2        % if it was a miss
                                    board_display(r1-1,c1)=10;      % Display miss
                                    drawScene(bs_scn,board_display)
                                    l=1;                           % end turn
                                    b=1;
                                    b2=1;
                                elseif board_display(r1-1,c1)==10|board_display(r1-1,c1)==9    % if it was already guess
                                    o=1;                                                        % guess right
                                    failsafe=failsafe+1;
                                elseif board_display(r1-1,c1)==1    % if it is the center divider
                                else                            % if it was a hit
                                    board_display(r1-1,c1)=9;  % mark it as a hit
                                    drawScene(bs_scn,board_display)
                                    cpu = cpu+1;
                                    r1=r1-1;                    % make this new focus
                                    l=1;                        % end turn
                                    b=1;
                                    b2=1;
                                end

                            end
                        end
                    end
                end
                l=1;
                b=1;
                b2=1;
            end

            if d == 3                                   % if player chose impossible difficulty
                b=0;

                while b==0
                    if board_display(r,c) == 2 | board_display(r,c) == 9 |board_display(r,c) == 10 % if the cpu guesses anywhere that isn't where a boat is, it tries a different location
                        %     r = randi(10);
                        %     c = randi(10);
                        % elseif board_display(r,c) == 9
                        %     r = randi(10);
                        %     c = randi(10);
                        % elseif board_display(r,c) == 10
                        r = randi(10);
                        c = randi(10);
                    else                                % if it hits a ship, mark it
                        board_display(r,c) = 9; 
                        drawScene(bs_scn,board_display)
                        cpu=cpu+1;
                        l=1;
                        b=1;
                    end
                end
            end
        end

    end
    endscreen=simpleGameEngine('endscreen.png',84,84);

    board_display = 6*ones(6,9);
    board_display(5,5)=4; % replay
    % board_display(6,5)=5; % end
    board_display(2,5)=1; % you



    if p1==17                                           % if player wins
        board_display(3,5)=2;                           % display player wins
    elseif cpu==17                                      % if player loses
        board_display(3,5)=3;                           % display player loses
    end
    drawScene(endscreen,board_display)
    loop=0;
    while loop == 0
        [r,c]=getMouseInput(endscreen);
        if r==5&&c==5
            loop=1;
            break
        elseif r==7&&c==5
            loopgame=0;
            loop=1;
            % close all
            break
            

        end
    end
end




%                       Bug List:
%
%
%   Player can attack their own side
%



% Fixed Bugs:
%
%
% Player can attack their own side
% If a player attacks somewhere they aleady guessed, it counts as a hit
% Battleships can be placed anywhere
% Battleships can be placed inside of eachother




