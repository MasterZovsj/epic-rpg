function [currentLocation] = movePlayer(currentLocation,thisMap)
%movePlayer When called the function moves the player on the map
%   Detailed explanation goes here
global START_GAME
playerSymbol = '@';
    if START_GAME == true
        [ii,jj]=find(thisMap.fullMap==' ');
        kk=[ii,jj];
        currentLocation=kk(randi(length(kk)),:);
%         playerLocation=thisMap.fullMap(currentLocation(1),currentLocation(2));
        thisMap.fullMap(currentLocation(1),currentLocation(2)) = playerSymbol;
        START_GAME=false;
    end
%% MAP NAVIGATION
thisMap.fullMap(currentLocation(1),currentLocation(2)) = '@';

disp(thisMap.fullMap)
fprintf('What direction would you like to go?\n(''8'' north | ''2'' south | ''4'' west | ''6'' east)\n')
choice = input('','s'); %!!need to handle if input is not int!!
lastLocation = currentLocation;
if (choice == "8")
    fprintf('You have chosen to head northward.\n')
    currentLocation(1) = currentLocation(1) - 1;
    clc
elseif (choice == "2")
    fprintf('You have chosen to head southward.\n')
    currentLocation(1) = currentLocation(1) + 1;
    clc
elseif (choice == "4")
    fprintf('You have chosen to head westward.\n')
    currentLocation(2) = currentLocation(2) - 1;
    clc
elseif (choice == "6")
    fprintf('You have chosen to head eastward.\n')
    currentLocation(2) = currentLocation(2) + 1;
    clc
% elseif (exist('choice') == 0)
%     fprintf('You must input 8, 2, 4, or 6')
else
    clc
    fprintf('You did not choose a direction!\n')
    thisMap.fullMap(currentLocation(1),currentLocation(2))=playerSymbol;
%     return
end
%% MAP BOUNDARIY CHECK
% make sure the player cannot go below row 1 or column 1 or above maxRow
% minColumn %%%NOT SURE IF NEEDED
% % if (currentLocation(1) < 1)
% %     fprintf('You can''t exit the map!!\r\n')
% %     currentLocation(1) = currentLocation(1) +1;
% % elseif (currentLocation(2) < 1)
% %     fprintf('You can''t exit the map!!\r\n')
% %     currentLocation(2) = currentLocation(2) + 1;
% % elseif (currentLocation(1) > maxRow)
% %     fprintf('You can''t exit the map!!\r\n')
% %     currentLocation(1) = currentLocation(1) - 1;
% % elseif (currentLocation(2) > maxColumn)
% %     fprintf('You can''t exit the map!!\r\n')
% %     currentLocation(2) = currentLocation(2) - 1;
% % end
end

