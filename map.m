classdef map
    %MAP class where the map, player location, enemy location, and more are
    %stored
    %   Detailed explanation goes here
    
    properties
        fullMap
        viewMap
        lastTile
        playerSymbol
        playerLocation
        
    end
    
    methods
%         function obj = map(inputArg1,inputArg2)
%             %UNTITLED Construct an instance of this class
%             %   Detailed explanation goes here
%             obj.Property1 = inputArg1 + inputArg2;
%         end
        
        function outputArg = buildMap(obj,inputArg)
            %BUILDMAP is called to build a new iteration of the game map. Player is
            %given the option to move each time function is called.
            outputArg = obj.Property1 + inputArg;
        end
    end
end

