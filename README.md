# GithubMates

[![Build Status](https://travis-ci.org/gdurelle/githubmates.svg?branch=master)](https://travis-ci.org/gdurelle/githubmates)

A sample app to geolocate github committers from a given repo.

http://githubmates.herokuapp.com/

## Goal:

**1-** Geolocate all committers (contributors) from a Github repository.

Home page will have a form to enter a Github's repository name.

Committers'detail page will display a Google Map with markers geolocating each committer.

Each marker will be click-able, to display an info-bubble with user's informations (including avatar). Non-geolocalisable commiters will be listed on the page.

**2-** Add a bonus feature using the Github API.

## Prefered test frameworks & tools

* Rspec
* Capybara
* VCR

## Additionnal notes

Sadly I can't add a Sidekiq here because it's hosted on Heroku. (And therefore would cost me money).

In the ideal situation you want to add Redis and send Github API requests in background. Also you's want to add a bit of caching for Geocoder requests.
