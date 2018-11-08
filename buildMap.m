%%  TODO
%1. Use random variables to build the map size - min 5x5,max 50,50
%2. Fix game crash when non integer is inputed
%3. Randomly generate encounters depending on direction chosen
%4. ???Preset "walls" to direct play and give a sense of direction???
%5. Change character symbol to match chosen class
%6. Prevent player from breaking the game by going out of map--DONE MF 11/6
%7. add a 'depth' variable to map that increases when door to found
%8. add a door to each level that allows the player to move to a new map

function [lastTile,lastLocation] = buildMap(location,map,playerSymbol)
%BUILDMAP is called to build a new iteration of the game map. Player is
%given the option to move each time function is called.

%   Function starts by calling the value of START_GAME to determine if this
%   is initial setup. If it is the initial setup, the map is built using a
%   for loop and prespecified values. A random location is generated as the
%   starting location. The value of START_GAME is set to false to prevent
%   starting prodecures from repeating. Player is shown the map and given
%   the option to move   N       8     If any of these options are not 
%                      W|-|E = 4|-|6
%                        S       2
%   picked, an error is thrown and function calls its self
%% DECLARE VARIABLES
global START_GAME
maxRow = 20;
maxColumn = 40;
%% INITIAL MAP CREATION
while START_GAME == 1
    
for i=1:maxRow
    for j=1:maxColumn
        map(i,j) = '#';
    end
end
    

location = randi(10,1,2); %Initialize starting location

START_GAME = false;
end
%% MAP NAVIGATION
map(location(1),location(2)) = playerSymbol;

disp(map)
fprintf('What direction would you like to go?\n(''8'' north | ''2'' south | ''4'' west | ''6'' east)\n')
choice = input(''); %!!need to handle if input is not int!!
lastLocation = location;
if (choice == 8)
    fprintf('You have chosen to head northward.\n')
    map(location(1),location(2))='E';
    location(1) = location(1) - 1;
    clc
elseif (choice == 2)
    fprintf('You have chosen to head southward.\n')
    map(location(1),location(2))='E';
    location(1) = location(1) + 1;
    clc
elseif (choice == 4)
    fprintf('You have chosen to head westward.\n')
    map(location(1),location(2))='E';
    location(2) = location(2) - 1;
    clc
elseif (choice == 6)
    fprintf('You have chosen to head eastward.\n')
    map(location(1),location(2))='E';
    location(2) = location(2) + 1;
    clc
% elseif (exist('choice') == 0)
%     fprintf('You must input 8, 2, 4, or 6')
else
    clc
    fprintf('You did not choose a direction!\n')
    buildMap(location,map,playerSymbol);
%     return
end
%% MAP BOUNDARIY CHECK
% make sure the player cannot go below row 1 or column 1 or above maxRow
% minColumn
if (location(1) < 1)
    fprintf('You can''t exit the map!!\r\n')
    location(1) = location(1) +1;
elseif (location(2) < 1)
    fprintf('You can''t exit the map!!\r\n')
    location(2) = location(2) + 1;
elseif (location(1) > maxRow)
    fprintf('You can''t exit the map!!\r\n')
    location(1) = location(1) - 1;
elseif (location(2) > maxColumn)
    fprintf('You can''t exit the map!!\r\n')
    location(2) = location(2) - 1;
end
lastTile = map(location(1),location(2));
%% OUTPUT
%not using the regular function output because map and location should
%always be stored in base.
assignin('base','map',map)
assignin('base','location',location)

end


