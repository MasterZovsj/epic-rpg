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
room_num=5;
for k=1:room_num
room_height = randi([5,15]);
room_width = randi([5,30]);
x_start = randi([2,map_width-room_width]);
y_start = randi([2,map_height-room_height]);
    
    for j=1:room_height
        for i=1:room_width  
            if i==1
                map(y_start+j,x_start+i)='#'; %used on the upper border
            elseif i==room_width
                map(y_start+j,x_start+i)='#'; %used on lower border
            elseif j==1
                map(y_start+j,x_start+i)='#'; %used on left border
            elseif j==room_height
                map(y_start+j,x_start+i)='#'; %used on right border
            else
                map(y_start+j,x_start+i)=' '; %used everywhere else
            end
        end
    end
end
disp(map)
end

