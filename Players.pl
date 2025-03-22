% Define 2 teams
team(team_a).
team(team_b).

% Define ball
:- dynamic ball/4.
ball(200,100,0,0).

% x1, x2, y1, y2
goal_a(0, 50, 50, 150).
goal_b(350, 400, 50, 150).

% Define players for each teams
% Example: player(teamName, playerName, position, stats(goalkeeping,defending,passing,attacking,speed,vision,stamina), position(x, y)).

% Team A players
player(team_a, a1, gk, stats(90, 40, 35, 30, 30, 85, 80)).
player(team_a, a2, def, stats(15, 90, 60, 55, 70, 80, 85)).
player(team_a, a3, def, stats(10, 85, 65, 55, 75, 80, 90)).
player(team_a, a4, def, stats(15, 70, 80, 65, 80, 90, 85)).
player(team_a, a5, def, stats(10, 60, 85, 75, 85, 90, 80)).
player(team_a, a6, mid, stats(10, 65, 80, 75, 80, 85, 90)).
player(team_a, a7, mid, stats(10, 55, 70, 85, 90, 80, 70)).
player(team_a, a8, mid, stats(15, 60, 75, 90, 85, 85, 80)).
player(team_a, a9, atk, stats(15, 60, 80, 80, 90, 80, 75)).
player(team_a, a10, atk, stats(10, 65, 85, 85, 90, 85, 80)).
player(team_a, a11, atk, stats(10, 85, 60, 55, 70, 75, 80)).

% Team B players
player(team_b, b1, gk, stats(85, 75, 65, 60, 70, 80, 85)).
player(team_b, b2, def, stats(80, 85, 60, 55, 70, 75, 85)).
player(team_b, b3, def, stats(75, 80, 60, 55, 75, 80, 85)).
player(team_b, b4, def, stats(70, 65, 80, 70, 75, 85, 80)).
player(team_b, b5, def, stats(75, 70, 85, 70, 80, 85, 75)).
player(team_b, b6, mid, stats(70, 60, 80, 75, 80, 80, 85)).
player(team_b, b7, mid, stats(60, 55, 65, 85, 80, 75, 70)).
player(team_b, b8, mid, stats(65, 60, 75, 90, 85, 80, 75)).
player(team_b, b9, atk, stats(65, 60, 80, 80, 85, 80, 75)).
player(team_b, b10, atk, stats(70, 65, 85, 85, 90, 85, 80)).
player(team_b, b11, atk, stats(80, 85, 60, 55, 70, 75, 80)).

% Deciding Actions
% Attacking: Shooting
should(shoot, Team, Player) :-
    player(Team, Name, Position, stats(_, _, _,Attacking, Speed, Vision, _)),
    (Position = forward; Position = midfielder),
    Attacking >= 75,
    Speed >= 80,
    Vision >= 75,
    % TODO: Add a way to find distance to ball and goal.
    distanceBall >= ?,
    distanceGoal >= ?.



distance_to_goal(goal(X1, X2, Y1, Y2), Player) :-