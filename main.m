%{
***************************************************************************
*    ,------.,------. ,--. ,-----.    ,------. ,------.  ,----.           *
*    |  .---'|  .--. '|  |'  .--./    |  .--. '|  .--. ''  .-./           *
*    |  `--, |  '--' ||  ||  |        |  '--'.'|  '--' ||  | .---.        *
*    |  `---.|  | --' |  |'  '--'\    |  |\  \ |  | --' '  '--'  |        *
*    `------'`--'     `--' `-----'    `--' '--'`--'      `------'         *                                                       *                                by                                       *
*                           Micah Fierro                                  *
*                           Gary Jackson                                  *
*                                                                         *
*                                                                         *
* Robert Pitman-Gammon            Dec. 10 2018              Final Project *
***************************************************************************
%}

clear
clc
%% GLOBAL VARIABLES
global START_GAME
START_GAME = true;
%% Initialize variables
location = [];
map = '';

%% MAIN CODE

[player,playerSymbol] = characterCreation();

while player.Health ~= 0
[lastTile,lastLocation] = buildMap(location,map,playerSymbol);
event = eventGenerator(lastTile);

% switch(event)
%     case 4
%         
%     otherwise
%         fprintf('lol not yet')
% end
        
player.Health = player.Health - 0.5; %temp to end while loop

end
%% END GAME
fprintf('YOU DUN DIED SON\n')
% build an epic credits scence by using the timer function