Feature: Print Receipt

  When a customer comes into the practice, we need to be able to 
  print out a receipt.
  
  Background: Prices
    We have a fixed price list
  
    Given the following operations are available:
      | operation        | price |
      | routine check up | 10    |
      | shots            | 5     |

  Scenario: Dave Pays for Fluffy
    Given there is an owner Dave Atkins, let's call him "Dave"
    And Dave brings his pet named Fluffy into the clinic for the following operations:
      | routine check up |
      | shots            |
    When the veterinarian charges him for the visit
    And Dave pays cash
    Then Dave is given a receipt which looks like this:
      """
      Operations:
        $10 (routine check up)
        $5 (shots)
      
      Total to pay: $15
      
      Paid cash, received with thanks
      
      """
