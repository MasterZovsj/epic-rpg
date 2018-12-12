%% TODO
% 1. Randomize Stats within a range for each type of enemy and
%     assign a adverb to describe the enemy depending on where
%     the stat fell within the range.
% 2. Tie the level to the depth of the map

function [thisEnemy] = enemyGenerator(level)
%ENEMYGENERATOR When called function generates an enemy based on the
%inputed level and type
%   Detailed explanation goes here
enemyOptions = {'slime' 'goblin' 'ogre' 'snail' 'bandit'};
weaponOptions = {'spear' 'sickle' 'mace' 'acid' 'fists'};

% get two random numbers no larger than the number of enemy/weapon options
i = randi(numel(enemyOptions));
j = randi(numel(weaponOptions));
%set 
a = string(enemyOptions(i));
b = string(weaponOptions(j));

  %set the type based stats
  switch(a)
    case enemyOptions(1)
      typeStats = [1 3 4];
      health = 5.0;
    case enemyOptions(2)
      typeStats = [3 2 2];
      health = 3.0;
    case enemyOptions(3)
      typeStats = [5 1 3];
      health = 10.0;
    case enemyOptions(4)
      typeStats = [2 5 1];
      health = 9.0;
    case enemyOptions(5)
      typeStats = [4 4 5];
      health = 8.0; 
  end
  %set the weapon based stats 
  switch(b)
    case weaponOptions(1)
      weaponStats = [4 3];
    case weaponOptions(2)
      weaponStats = [2 1];
    case weaponOptions(3)
      weaponStats = [3 4];
    case weaponOptions(4)
      weaponStats = [5 0];
    case weaponOptions(5)
      weaponStats = [1 5];
  end
  
  %make sure the level is defined, if not, set to level 1
  if exist('level','var') ~= 1
      level = 1;
  end
%build the stats array
stats = [typeStats weaponStats];
%scale stats and health to level
stats = stats.*level;
health = health*level;
%input everything into the enemy class and output
thisEnemy = enemy(a,b,stats,level,health);

end

