function [player,enemy] = combat(player,enemy)
% This function takes two characters as input, makes them fight until one
% of them dies, and then returns both players with updated health.
    if player.getSpd() >= enemy.getSpd() % Player goes first.
        attack = player;
        defend = enemy;
    else % Enemy goes first.
        attack = enemy;
        defend = payer;
    end
    while attack.isAlive() && defend.isAlive()
        damage = attack.getStr() - defend.getDef();
        if damage < 0
            damage = 0;
        end
        defend = defend.takeDamage(damage);
        fprintf('%s dealt %i damage to %s\n',attack.getName(),damage,defend.getName());
        fprintf('%s has %i health left.\n',attack.getName(),attack.getHealth());
        fprintf('%s has %i health left.\n',defend.getName(),defend.getHealth());
        temp = attack;
        attack = defend;
        defend = temp;
    end
    if length(class(attack)) == length(class(player))
        if class(attack) == class(player)
            player = attack;
            enemy = defend;
        end
    else
        player = defend;
        enemy = attack;
    end
end