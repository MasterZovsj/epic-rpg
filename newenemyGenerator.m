function [thisEnemy] = newenemyGenerator(level,depth,location)
% A function that takes the level of a monster and the depth of the floor
% and returns a randomly generated enemy based on input data.
    if isnumeric(level) == false % Defaults level to 1 if it's not passed in.
        level = 1;
    end
    if isnumeric(depth) == false % Defaults depth to 1 if it's not passed in.
        depth = 1;
    end
    if isnumeric(location) == false || isvector(location) == false % Defaults location to [0,0] if it's not passed in.
        location = [0,0];
    end

    typeOptions = {{'Bat' 'Thief' 'Roach'} {'Dog' 'Bandit' 'Scorpion'} {'Wolf' 'Assassin' 'Giant Centipede'} {'Warg'}}; % Defines some type options.
    weaponOptions = {{'2x4 Board' 'Corroded Pipe' 'Clay Brick' 'Splintered Shovel'} {'Reinforced Board' 'Old Pipe' 'Stone Brick' 'Stone Shovel'} {'Nail Board' 'New Pipe' 'Steel Brick' 'Steel Shovel'} {'Death Claws'}}; % Defines some weapon options.

    i = randi(numel(typeOptions{depth})); % Randomly selects a number for a type option.
    j = randi(numel(weaponOptions{depth})); % Randomly selects a number for a weapon option.
    
    type = string(typeOptions{depth}(i));   %Selects an enemy type option.
    weapon = string(weaponOptions{depth}(j));   %Selects an enemy weapon option.
    
    switch(type)
        case typeOptions{4}(1) % Warg
            str = 4*level;
            def = 3*level;
            spd = 4*level;
            health = 25*level;
        case typeOptions{depth}(1) % Bat, Dog, Wolf
            str = 3*level;
            def = 1*level;
            spd = 4*level;
            health = 15*level;
        case typeOptions{depth}(2) % Thief, Bandit and Assassin
            str = 4*level;
            def = 2*level;
            spd = 3*level;
            health = 20*level;
        case typeOptions{depth}(3) % Roach, Scorpion and Giant Centipede
            str = 2*level;
            def = 0*level;
            spd = 5*level;
            health = 10*level;
    end
    
    switch(weapon)
        case weaponOptions{4}(1) %Death Claws
            str = str+16;
            def = def+16;
            spd = spd+12;
        case weaponOptions{depth}(1) % 2x4 Board, Reinforced Board and Nail Board
            str = str+(2*depth);
            def = def+(3*depth);
            spd = spd+(1*depth);
        case weaponOptions{depth}(2) % Corroded Pipe, Old Pipe and New Pipe
            str = str+(2*depth);
            def = def+(1*depth);
            spd = spd+(3*depth);
        case weaponOptions{depth}(3) % Clay Brick, Stone Brick and Steel Brick
            str = str+(3*depth);
            def = def+(1*depth);
            spd = spd+(2*depth);
        case weaponOptions{depth}(4) % Splintered Shovel, Stone Shovel and Steel Shovel
            str = str+(2*depth);
            def = def+(2*depth);
            spd = spd+(2*depth);
    end
    
    thisEnemy = newenemy(type,weapon,str,def,spd,health,level,location); % Creates the new enemy.
end