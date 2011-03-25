@games
Feature: Games
  In order to have games on my website
  As an administrator
  I want to manage games

  Background:
    Given I am a logged in refinery user
    And I have no games

  @games-list @list
  Scenario: Games List
   Given I have games titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of games
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @games-valid @valid
  Scenario: Create Valid Game
    When I go to the list of games
    And I follow "Add New Game"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 game

  @games-invalid @invalid
  Scenario: Create Invalid Game (without title)
    When I go to the list of games
    And I follow "Add New Game"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 games

  @games-edit @edit
  Scenario: Edit Existing Game
    Given I have games titled "A title"
    When I go to the list of games
    And I follow "Edit this game" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of games
    And I should not see "A title"

  @games-duplicate @duplicate
  Scenario: Create Duplicate Game
    Given I only have games titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of games
    And I follow "Add New Game"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 games

  @games-delete @delete
  Scenario: Delete Game
    Given I only have games titled UniqueTitleOne
    When I go to the list of games
    And I follow "Remove this game forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 games
 