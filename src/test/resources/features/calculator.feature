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

  Scenario: divide two numbers
    Given Two input values, 6 and 2, and operation /
    When I perform the operation
    Then I expect the result 3

  Scenario: divide by zero
    Given Two input values, -7 and 0, and operation /
    When I perform the operation
    Then I expect the divide by zero exception
    
  Scenario: raise a number to a power
    Given Two input values, 2 and 3, and operation ^
    When I perform the operation
    Then I expect the result 8

    Scenario: raise a number to a negative power
      Given Two input values, 6 and -2, and operation ^
      When I perform the operation
      Then I expect the negative power exception

  Scenario: raise zero to zero power
    Given Two input values, 0 and 0, and operation ^
    When I perform the operation
    Then I expect the negative power exception

  Scenario Outline: use calculator
    Given Two input values, <first> and <second>, and operation <opt>
    When I perform the operation
    Then I expect the result <result>

    Examples:
      | first | second | opt  | result |
      | 6     | 2      | *      | 12     |
      | -6    | 2      | *      | -12    |
      | 0     | 2      | *      | 0      |
      | 6     | 2      | /      | 3      |
      | -6    | 2      | /      | -3     |
      | 6     | 12     | /      | 0      |
      | 6     | 0      | ^      | 1      |
      | 6     | 2      | ^      | 36     |
      | -6    | 4      | ^      | 1296   |

