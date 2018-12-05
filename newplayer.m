classdef newplayer < character
    %Subclass for creating the player.
    
    properties
%        Name
        Class
        Exp
    end
    
    methods
        function p = newplayer(class,weapon,str,spd,luck,health)
            p@character(weapon,str,spd,luck,health,1);
%            p.Name = name;
            p.Class = class;
            p.Exp = 0;
        end
    end
end