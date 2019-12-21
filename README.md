# Funky Definitions
#### Epicodus Codereview 8
 This project is a review of creating PATHs using `Sinatra` and `Ruby`.

> A funky and fun app that allows users to create their own words and come up with unique definitions for each


## Views
###### Home
This page displays the current list of words and provides clickable links to display each one's definition individually
###### New Word
This page is where a user can create a word and it's initial definition
###### View Word
This page is where a user can view a specific word and it's current definitions as well as get access to the Edit Word page through a clickable link
###### Edit Word
This page is where the user can change the spelling of a word, add or remove definitions as well as getting links to Edit Definition page
###### Edit Definition
This page is where the user can change the wording of a definition

## Installation
* Install Ruby 2.5.7 on your machine
* Clone the git repository at _https://github.com/unfinishedideas/codereview8.git_
* Run Bundle install from terminal
* Type: Ruby App.rb from the root directory and navigate to localhost:4567 on your browser

## Heroku
To view on `Heroku` go to _https://protected-wave-64513.herokuapp.com/home/new_word_

## Known Bugs
* Strange pathing error when editing a word's definition and trying to re-enter the edit screen.

## Support and contact
If you have any issues viewing this site or any general questions about how to open please email me at
_PeteTheBeatWells@gmail.com_


## Technologies Used
**Ruby 2.5.7**  
_for back-end business logic and functionality_

**Sinatra**  
_for pathing {GET, POST, PATCH, DELETE}_

 **HTML**  
 _for construction_

 **CSS**  
_for general styling_

**Heroku**
_for easy deployment for your enjoyment_

### License
Copyright (c) 2019 Peter Wells  
Licensed under the GPL license.

_Last updated 12/20/19_
