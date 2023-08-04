@tag
Feature: Calculator

#  Scenario: add two numbers
#    Given Two input values, 1 and 2
#    When I add the two values
#    Then I expect the result 3
#
#  Scenario Outline: add two numbers
#    Given Two input values, <first> and <second>
#    When I add the two values
#    Then I expect the result <result>

#    Examples:
#      | first | second | result |
#      | 1     | 12     | 13     |
#      | -1    | 6      | 5  	|
#      | 2     | 2      | 4	    |

  Scenario: multiply two numbers
    Given Two input values, 6 and 2, and operation *
    When I perform the operation
    Then I expect the result 12

  Scenario Outline: use calculator
    Given Two input values, <first> and <second>, and operation <third>
    When I perform the operation
    Then I expect the result <result>

    Examples:
      | first | second | third  | result |
      | 6     | 2      | *      | 12     |
      | -6    | 2      | *      | -12    |
      | 0     | 2      | *      | 0      |

