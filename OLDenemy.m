classdef enemy
    %ENEMY class structure of enemy
    %   Defines the class enemy and allows for rapid construction of the
    %   enemy type TO-DO [finish this section]
    
    properties
        Type
        Weapon
        Stats
        Level
        Health
    end
    
    methods
        function obj = enemy(type,weapon,stats,level,health)
            %ENEMY Construct an instance of this class
            %   Detailed explanation goes here
            if nargin > 0 %Make sure the proper amount of args were passed in
                %Weapon Class Type must be a string - Stats must be a data
                %array - Level must be a scalar
                if isstring(type) && isstring(weapon) && isDataArray(stats) && isscalar(level) && isscalar(health) 
                    obj.Type = type;
                    obj.Weapon = weapon;
                    obj.Stats = stats;
                    obj.Level = level;
                    obj.Health = health;
                else
                    error('You screwed up somewhere, bud. [enemey class constructor]')
                end
            end
        end
     end
        
%         function outputArg = method1(obj,inputArg)
%             %METHOD1 Summary of this method goes here
%             %   Detailed explanation goes here
%             outputArg = obj.Property1 + inputArg;
%         end
end


