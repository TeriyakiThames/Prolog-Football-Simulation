# AI Project: Prolog Football Simulation
Run SWIPL in VSCode Terminal: `& "C:\Program Files\swipl\bin\swipl.exe"`

## `Actions.pl`
- Deciding each Actions:
     - General
          - Pass: `should(pass, Team, Player)`
          - Dribble: `should(dribble, Team, Player)`
     - Attacking
          - Shoot: `should(shoot, Team, Player)`
     - Defending
          - Tackle: `should(tackle, Team, Player1, Player2)`
          - Intercept: `should(intercept, Team, Player1, Player2)`
          - Clear: `should(clear, Tea, Player)`
          - Save: `should(save, Team, Player)`

## `Players.pl`
- Defined 2 teams
- Defined the players as:
```
player(
  teamName,
  playerName,
  role,
  stats(Goalkeeping, Defending, Passing, Attacking, Speed, Visoin, Stamina),
  position(x,y)
)
```
