classdef character
    %Parent class for all playable characters in the game.
    
    properties
        Level
        Weapon
        Str
        Def
        Spd
        Health
        Location
    end
    
    methods
        function obj = character(weapon,str,def,spd,health,level,location) % Parent class constructor for all game characters.
            if nargin == 0
                error('Null argument in Character constructor.')
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
            elseif isnumeric(location) == false || isvector(location) == false
                if isnumeric(location) == false && isvector(location) == false
                    error("Location isn't an array or numeric.")
                elseif isnumeric(location) == false
                    error('Location needs to be numeric.')
                elseif isvector(location) == false
                    error('Location needs to be a vector.')
                end
            else
                obj.Weapon = weapon;
                obj.Str = str;
                obj.Def = def;
                obj.Spd = spd;
                obj.Health = health;
                obj.Level = level;
                obj.Location = location;
            end
        end
    %---------------------------------------------------------------------------------------------------------------%
        function char = updateLocation(char,loc) % Returns the character with an updated location.
            char.Location = loc;
        end
    end
end