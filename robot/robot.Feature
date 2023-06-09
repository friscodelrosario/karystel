Feature:
  As a robot
  In order to manage the beepers in my world
  I want to follow five instructions, and adhere to Asimov's laws of robotics, though Skynet is coming

Scenario Outline: Turn left
  Given I face <direction>
  When I make a 270-degree turn
  Then I should face <new>

  Examples:
    | direction | new   |
    | north     | west  |
    | south     | east  |
    | east      | north |
    | west      | south |
  
Scenario Outline: Move
  Given the road <ahead> is clear
  When I move
  Then my street position should increment <y>
  Then my avenue position should increment <x>

  Examples:
    | ahead | y  | x  |   
    | north | 1  | 0  |
    | south | -1 | 0  |
    | east  | 0  | 1  |
    | west  | 0  | -1 |

  Given the road ahead is blocked
  When I move
  Then I turnoff

Scenario: Pick beeper
  Given a beeper at my position
  When I pick beeper
  Then my beeper count increments
  Then the beeper count at that position de-increments

Scenario: Put beeper
  Given I carry a beeper
  When I put beeper
  Then my beeper count de-increments
  Then the beeper count at that position increments

Scenario: Turnoff
  Given I am awake
  When I turnoff
  Then I report a catastrophic failure
  Then I cannot accept further instruction

Scenario Outline: Tests
	Given I am awake
	When I diagnose <state>
	Then I should assess <boolean>
  Examples:
    | state     								| boolean								 		|
    | front-is-clear						| front-is-clear				 		|
    | front-is-blocked  				| front-is-blocked  				|	
    | left-is-clear							| left-is-clear 						|
    | left-is-blocked 					| left-is-blocked				    |
    | right-is-clear						| right-is-clear 						|
    | right-is-blocked				  | right-is-blocked				  |
    | facing-north     				  | facing-north 							|
    | not-facing-north 				  | not-facing-north				 	|
    | facing-west      					| facing-west 							|
    | not-facing-west   				| not-facing-west					 	|
    | facing-south     				  | facing-south 							|
    | not-facing-south  				| not-facing-south 					|
    | facing-east       				| facing-east 							|
    | not-facing-east 				  | not-facing-east  					|
    | any-beepers-in-beeper-bag	| any-beepers-in-beeper-bag |
    | no-beepers-in-beeper-bag	| no-beepers-in-beeper-bag  |
 
