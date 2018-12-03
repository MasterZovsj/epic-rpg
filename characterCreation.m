%% TODO
% Broke the weapon damage - need to include that in player class.

function [thisPlayer,playerSymbol] = characterCreation()
%CHARACTERCREATION Creates a diaog box for the player to select their class
%and weapon
%   Allows the player to selected a class from classOptions and a weapon
%   from weaponOptions. A dialog box is created with two dropdown menus to
%   allow selection. If the user does not select a class or weapon the
%   defaults of Swordsman and Axe are provided. The selected class and
%   weapon are used to assign a set of stats to the player. Each class and
%   weapon has its own row vector that repersents different stats. The
%   player stats are created by appending the weapon stats to the end of
%   the class stats. Class stats are as follows [DM SP LK HT]. Weapon stats
%   are as follows [DD DF]. When combined the player stats are [DM SP Lk HT
%   DD DF] where DM = Damage Modifier, SP = Speed, Lk = Luck, HT = Health,
%   DD = Direct Damage, DF = Defense

%% Class and Weapon options
classOptions = {'Nurse' 'Construction Worker' 'Cook' 'Gambler'};
weaponOptions = {'2x4 Board' 'Old Pipe' 'Clay Brick' 'Splintered Shovel'};

%% Declare variables
%Edit these to change the character creation dialog box
CC_size = [400 200];

txt_size = [210 40];
txt_position = [(CC_size(1)-txt_size(1))/2 (CC_size(2)-txt_size(2))/2+50]; %this last number controls the height 
txt2_size = [210 40];
txt2_position = [(CC_size(1)-txt2_size(1))/2 (CC_size(2)-txt2_size(2))/2-10]; %this last number controls the height 

btn_size = [170 25];
btn_position = [(CC_size(1)-btn_size(1))/2 (CC_size(2)-btn_size(2))/2-70]; %this last number controls the height 

popup_size = [90 80];
popup_position = [(CC_size(1)-popup_size(1))/2 (CC_size(2)-popup_size(2))/2+9]; %this last number controls the height 
popup2_size = [90 80];
popup2_position = [(CC_size(1)-popup2_size(1))/2 (CC_size(2)-popup2_size(2))/2-53]; %this last number controls the height 


%% dialog code
prompt = {'Select a class','Select a starting weapon'};

d = dialog('Position',[680 558 CC_size],'Name','Character Creation');
txt = uicontrol('Parent',d,...
    'Style','text',...
    'Position',[txt_position txt_size],...
    'String',prompt{1});
txt2 = uicontrol('Parent',d,...
    'Style','text',...
    'Position',[txt2_position txt2_size],...
    'String',prompt{2});
popup = uicontrol('Parent', d,...
    'Style','popup',...
    'Position',[popup_position popup_size],...
    'String',classOptions,...
    'Callback',@popup_callback);
popup2 = uicontrol('Parent', d,...
    'Style','popup',...
    'Position',[popup2_position popup2_size],...
    'String',weaponOptions,...
    'Callback',@popup2_callback);
btn = uicontrol('Parent', d,...
    'Position',[btn_position btn_size],...
    'String','I accept my mission!',...
    'Callback','delete(gcf)');
playerClass = "Swordsman";
playerWeapon = "Axe";

%% callback funtions
uiwait(d);
    function popup_callback(popup,~)
        classChoice = popup.Value;
        popup_items = popup.String;
        playerClass = string(popup_items(classChoice,:));
%         disp(playerClass)
    end
    function popup2_callback(popup,~)
        classChoice = popup.Value;
        popup_items = popup.String;
        playerWeapon = string(popup_items(classChoice,:));
%         disp(playerWeapon)
    end
%% assign stats
    switch(playerClass)
        case classOptions(1)
%             classStats = [5 2 3];
            str = 5;
            spd = 2;
            luck =3;
            health = 8.0;
        case classOptions(2)
%             classStats = [3 5 2];
            str = 3;
            spd = 5;
            luck = 2;
            health = 6.0;
        case classOptions(3)
%             classStats = [4 1 4];
            str = 3;
            spd = 1;
            luck = 5;
            health = 10.0;
        case classOptions(4)
%             classStats = [3 3 3];
            str = 3;
            spd = 3;
            luck = 3;
            health = 7.0;
        otherwise
            error('This isn''t a class option!')
    end 
    switch(playerWeapon)
        case weaponOptions(1)
            weaponStats = [2 4];
        case weaponOptions(2)
            weaponStats = [5 1];
        case weaponOptions(3)
            weaponStats = [4 2];
        case weaponOptions(4)
            weaponStats = [3 3];
        otherwise
            error('This isn''t a weapon option!')
    end
    playerStats = [weaponStats];
%% CREATE PLAYER
thisPlayer = newplayer(playerClass,playerWeapon,str,spd,luck,health);
c = char(thisPlayer.Class);
playerSymbol = c(1);
end