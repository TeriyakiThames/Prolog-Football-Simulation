# AI Project: Prolog Football Simulation

## `Actions.pl`
### TODOS:
- **should(shoot, Team, Player)**
  - [ ] is_in_possession(Player)
  - [ ] distance_to_goal >= ?
- **should(pass, Team, Player)**
  - [ ] \+ opponent_near_position()
  - [ ] \+ near_own_goal()
- **should(dribble, Team, Player)**
- **should(tackle, Team, Player1, Player2)**
-   - [ ] /+ is_in_possession(Team)
    - [ ] is_within_reach(Player1, Player2)
- **should(intercept, Team, Player1, Player2)**
-   - [ ] opponent_making_pass(Team, Player2)
    - [ ] is_closer_to_ball(Player1, Player2)
- **should(clear, Tea, Player)**
- **should(save, Team, Player)**
    - [ ] good_catching_pos()

## `Players.pl`
- Defined 2 teams
- Defined the players as: `player(teamName, playerName, role, stats(Goalkeeping, Defending, Passing, Attacking, Speed, Visoin, Stamina), position(x,y))`
