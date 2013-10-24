Feature: code-breaker starts game

  As a code-breaker
  I want to win a game or try to win at least
  So that I can guess code few time

  Scenario Outline: submit correct guess
    Given the secret code is "<code>"
    When I guess "<code>"
    Then the result should be "You won!"

  Scenarios: no matches
    | code |
    | 1234 |
    | 4444 |

  Scenario Outline: submit incorrect guess on last attempt
    Given the secret code is "<code>" and the last attempt is being
    When I guess "<guess>"
    Then the result should be "You lost!"

  Scenarios: no matches
    | code | guess |
    | 1234 | 2222  |
    | 3333 | 3331  |