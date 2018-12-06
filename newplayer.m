classdef newplayer < character
    %Subclass for creating the player.
    
    properties
        Name
        Class
        Exp
        Luck
        Inventory
    end
    
    methods
        function p = newplayer(name,class,weapon,str,def,spd,luck,health)
            p@character(weapon,str,def,spd,health,1);
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
                p.Exp = 0;
                p.Luck = luck;
                p.Inventory = [];
            end
        end
    end
end