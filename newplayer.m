classdef newplayer < character
    %Subclass for creating the player.
    
    properties
        Name
        Class
        Exp = 0
        Luck
        Inventory = []
    end
    
    methods
        function p = newplayer(name,class,weapon,str,def,spd,luck,health,location) % Constructor for a new player.
            p@character(weapon,str,def,spd,health,1,location);
            if nargin == 0
                error('Null argument in player constructor.')
            elseif isstring(name) == false
                error('Name needs to be a string.')
            elseif isstring(class) == false
                error('Class needs to be a string.')
            elseif isscalar(luck) == false
                error('Luck needs to be scalar.')
            else
                p.Name = name;
                p.Class = class;
                p.Luck = luck;
            end
        end
    %---------------------------------------------------------------------------------------------------------------%
        function name = getName(player) % Returns the player name.
            name = player.Name;
        end

        function item = inventory(player) % Allows the player to access their inventory.
            item = listdlg('PromptString','Select a weapon',...
                        'SelectionMode','single',...
                        'ListString',player.Inventory);
            item = string(item);
        end
    end
end