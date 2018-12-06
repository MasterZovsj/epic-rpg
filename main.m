%{
***************************************************************************
*    ,------.,------. ,--. ,-----.    ,------. ,------.  ,----.           *
*    |  .---'|  .--. '|  |'  .--./    |  .--. '|  .--. ''  .-./           *
*    |  `--, |  '--' ||  ||  |        |  '--'.'|  '--' ||  | .---.        *
*    |  `---.|  | --' |  |'  '--'\    |  |\  \ |  | --' '  '--'  |        *
*    `------'`--'     `--' `-----'    `--' '--'`--'      `------'         *
*                                by                                       *
*                           Micah  Fierro                                 *
*                           Gary  Jackson                                 *
*                           Troy Plageman                                 *
*                                                                         *
*     Robert Pitman-Gammon           Dec. 10 2018           Final Project *
***************************************************************************
%}

clear
clc

%% GLOBAL VARIABLES
global START_GAME
START_GAME = true;
%% Initialize variables
currentLocation = [];
%% MAIN CODE
[player,playerSymbol] = characterCreation();
thisMap=mapClass(buildMap());
disp(thisMap.fullMap)
while 1 == true
    currentLocation=movePlayer(currentLocation,thisMap);
end
%% END GAME
fprintf('YOU DUN DIED SON\n')
% build an epic credits scence by using the timer function