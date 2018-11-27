function [map] = buildMap()
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

%% generate a room
room_num=3;
for k=1:room_num
x_start = randi([2,map_width-1]);
y_start = randi([2,map_height-1]);
roomwidth = randi([5,30]);
roomheight = randi([5,30]);
    for j=1:roomwidth
        for i=1:roomheight  
            if i==1
                map(y_start+j,x_start+i)='#'; %used on the upper border
            elseif i==roomheight
                map(y_start+j,x_start+i)='#'; %used on lower border
            elseif j==1
                map(y_start+j,x_start+i)='#'; %used on left border
            elseif j==roomwidth
                map(y_start+j,x_start+i)='#'; %used on right border
            else
                map(y_start+j,x_start+i)=' '; %used everywhere else
            end
        end
    end
end
end

