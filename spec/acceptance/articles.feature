Feature: Reading published articles

  Scenario: no articles have been published
    Given there are no published articles
    When I visit the homepage
    Then I should see a no articles message

  Scenario: at least one article has been published
    Given there is at least one published article
    When I visit the homepage
    Then I should see an abstract for each published article

  Scenario: more than 10 articles have been published are paginated
    Given there are more than 10 published articles
    When I visit the homepage
    Then I should see abstracts for the first 10 published articles
    And I should not see abstracts for the remaining published articles
    When I go to the next page of published articles
    Then I should see abstracts for the remaining published articles

  Scenario: articles have been written that are unpublished
    Given there are unpublished articles
    When I visit the homepage
    Then I should not see an abstract for any unpublished articles
