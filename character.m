classdef character
    %Parent class for all playable characters in the game
    
    properties
        Weapon
        Str
        Def
        Spd
        Health
        Level
    end
    
    methods
        function obj = character(weapon,str,def,spd,health,level)
            if nargin>0
                if isstring(weapon) && isscalar(str) && isscalar(def) && isscalar(spd) && isscalar(health) && isscalar(level)
                    obj.Weapon = weapon;
                    obj.Str = str;
                    obj.Def = def;
                    obj.Spd = spd;
                    obj.Health = health;
                    obj.Level = level;
                elseif isstring(weapon) == false
                    error('Weapon needs to be a string.')
                elseif isscalar(str) == false
                    error('Strength needs to be scalar.')
                elseif isscalar(def) == false
                    error('Defense needs to be scalar.')
                elseif isscalar(spd) == false
                    error('Speed needs to be scalar.')
                elseif isscalar(health) == false
                    error('Health needs to be scalar.')
                end
            else
                error('Null argument in Character constructor.')
            end
        end
    end
end