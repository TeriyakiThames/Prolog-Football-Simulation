% Deciding Actions
% Attacking: Shooting =============================================================================
should(shoot, Team, Player) :-
    player(Team, Name, Role, stats(_, _, _,Attacking, Speed, Vision, _)),
    (Position = forward; Position = midfielder),
    Attacking >= 75,
    Speed >= 80,
    Vision >= 75,
    % TODO:
    is_in_possession(Player)
    distance_to_goal >= ?.

% General: Pass ===================================================================================
should(pass, Team, Player) :-
    player(Team, Name, Role, stats(_, _, Passing ,Attacking, Speed, Vision, _), position(PX, PY)),
    Passing >= 70,
    teammate_in_range(),
    % TODO: 
    \+ opponent_near_position(),
    \+ near_own_goal().

% General: Dribble ================================================================================
should(dribble, Team, Player) :-
    player(Team, Name, Role, stats(_, _, _, _, Speed, _, Stamina), position(PX, PY)),
    \+ should(shoot, Team, Player),
    \+ should(pass, Team, Player),
    Speed >= 75,
    Stamina >= 75.

% Defending: Tackle ===============================================================================
should(tackle, Team, Player1, Player2) :-
    player(Team, Player, Role, stats(_, Defending, _, _, _, _, _)),
    (Position = def; Position = mid),
    Defending >= 80,
    % TODO:
    /+ is_in_possession(Team),
    is_within_reach(Player1, Player2).

% Defending: Intercept ============================================================================
should(intercept, Team, Player1, Player2) :-
    player(Team, Player1, Position1, stats(_, Defending, _, _, _, Vision, _), position(PX1, PY1)),
    (Position1 = def; Position1 = mid),
    Defending >= 75,
    Vision >= 70,
    % TODO :
    opponent_making_pass(Team, Player2),
    is_closer_to_ball(Player1, Player2).

% Defending: Clear ================================================================================
should(clear, Tea, Player) :-
    Player(Team, Name, Role, _, position(PX, PY)),
    ball(BX, BY, _, _),
    in_penalty_box(),
    opponent_near_position(),
    \+ teammate_in_range().

% Defending: Save =================================================================================
should(save, Team, Player) :- 
    Player(Team, Name, gk, stats(Goalkeeping, _, _, _, _, _, _), position(PX, PY)),
    Goalkeeping >= 70,
    in_penalty_box(),
    % ball in kick/pass state
    ball(BX, BY, VX, VY),
    (VX \= 0, VY \= 0),
    % ball is within catch range
    distanceBall <= 30,
    % ball is in front of the goalie
    good_catching_pos().