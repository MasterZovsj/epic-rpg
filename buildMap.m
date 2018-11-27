function [outputArg1,outputArg2] = buildMap(inputArg1,inputArg2)
%BUILDMAP v2.0 Creates the base map and rooms
%   Detailed explanation goes here
%define the total map reigon
map_width = 120;
map_height = 45;

for j=1:map_width
    for i=1:map_height
        if i==1
            map(i,j)='-'; %used on the upper border
        elseif i==map_height
            map(i,j)='-'; %used on lower border
        elseif j==1
            map(i,j)='|'; %used on left border
        elseif j==map_width
            map(i,j)='|'; %used on right border
        else
            map(i,j)=' '; %used everywhere else
        end
    end
end
assignin('base','map',map)

end

