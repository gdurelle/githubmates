Feature: Geolocate every commiters from a given Github repo

Scenario:
  Given I'm on the home page
  And there is github repository's form
  When I fill the form with user = "rails", repo = "rails" and submit it
  Then I should see a Google Map with markers representing commiters of the repo
  And Every markers should have an info window containing commiter's infos.

Scenario:
  Given I'm on the home page
  And there is github repository's form
  When I fill the form with user = "gdurelle", repo = "railsdebutant" and submit it
  Then All commiters who don't have any location informations should be listed under the map.
