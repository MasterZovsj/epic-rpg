function [currentLocation] = movePlayer(currentLocation,thisMap)
%movePlayer When called the function moves the player on the map
%   First check to see if this is the start of the game. If it is, it give
%   the player a start location and sets that to currentLocation. Otherwise
%   it puts the PLAYER_SYMBOL at the current location on the map, and
%   displays the map. It then asks the player where they would like to
%   move. Once they make that choice, the  game checks to prevent them from
%   walking into impassable characters or walls.
global START_GAME
global PLAYER_SYMBOL
global MASTERMAP_IMPASSABLE_CHAR
global MASTERMAP_SIDE_CHAR
global MASTERMAP_TOP_CHAR
global MASTERMAP_BOTTOM_CHAR

    if START_GAME == true
        [ii,jj]=find(thisMap.fullMap==' ');
        kk=[ii,jj];
        currentLocation=kk(randi(length(kk)),:);
        thisMap.fullMap(currentLocation(1),currentLocation(2)) = PLAYER_SYMBOL;
        START_GAME=false;
    end
%% MAP NAVIGATION
thisMap.fullMap(currentLocation(1),currentLocation(2)) = PLAYER_SYMBOL;

disp(thisMap.fullMap)
fprintf('What direction would you like to go?\n(''8'' north | ''2'' south | ''4'' west | ''6'' east)\n')
choice = input('','s'); %pass the choice as a string to prevent any issues with variable names and incorrect entries
lastLocation = currentLocation;
% Change the location depending on the choice
if (choice == "8")%go up
    fprintf('You have chosen to head northward.\n')
    currentLocation(1) = currentLocation(1) - 1;
    clc
elseif (choice == "2")%go down
    fprintf('You have chosen to head southward.\n')
    currentLocation(1) = currentLocation(1) + 1;
    clc
elseif (choice == "4")%go left
    fprintf('You have chosen to head westward.\n')
    currentLocation(2) = currentLocation(2) - 1;
    clc
elseif (choice == "6")% go right
    fprintf('You have chosen to head eastward.\n')
    currentLocation(2) = currentLocation(2) + 1;
    clc
% elseif (exist('choice') == 0)
%     fprintf('You must input 8, 2, 4, or 6')
else %they didn't choose a direction
    clc %this is probably unnecisary 
    fprintf('You did not choose a direction!\n') %tell them the truth
    thisMap.fullMap(currentLocation(1),currentLocation(2))=PLAYER_SYMBOL;%this too
%     return
end
%% cHECK TO AVOID PLAYER EXITING WALLS
if thisMap.fullMap(currentLocation(1),currentLocation(2))==MASTERMAP_IMPASSABLE_CHAR||...
        thisMap.fullMap(currentLocation(1),currentLocation(2))==MASTERMAP_SIDE_CHAR||...
        thisMap.fullMap(currentLocation(1),currentLocation(2))==MASTERMAP_TOP_CHAR||...
        thisMap.fullMap(currentLocation(1),currentLocation(2))==MASTERMAP_BOTTOM_CHAR
    clc%why
    currentLocation=lastLocation;
    thisMap.fullMap(currentLocation(1),currentLocation(2))=PLAYER_SYMBOL;%just why, nothing changed
    fprintf('You cannot walk through walls!\n') %maybe insult them too
end
%% Check for Combat
% for 
% if thisMap.fullMap(currentLocation(1),currentLocation(2))==
% end