classdef mapClass
    %MAP class where the map, player location, enemy location, and more are
    %stored
    %   Detailed explanation goes here
    
    properties
        fullMap
%         viewMap
%         lastTile
%         playerSymbol
%         playerLocation
        
    end
    
    methods
        function obj = mapClass(fullMap)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            if nargin > 0 %Make sure the proper amount of args were passed in
                if ischar(fullMap) 
                  obj.fullMap = fullMap;
                else
                    error('You screwed up somewhere, bud. [Player class constructor]')
                end
            end 
        end
        
% %         function outputArg = buildMap(obj,inputArg)
% %             BUILDMAP is called to build a new iteration of the game map. Player is
% %             given the option to move each time function is called.
% %             outputArg = obj.Property1 + inputArg;
% %         end
    end
end

