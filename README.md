
# The Oracle 
# This app is an Oracle Deck Collection. To play the user choose a deck, then meditate on an answer that he would like to be answered by the universe, then he chooses a card and finally the app shows him the selected card.


# Implementation

OracleListViewController - This is the screen where the oracle decks are shown. It is an table view that shows the data fetched from the backend. From this screen you can see your favorites, see each deck's details from tapping the question mark icon on the cell and start the game by tapping the tableview cell.

OracleGameStepOneViewController - This screen display an message and can go to the game step two.

OracleGameStepTwoViewController - This screen allows the user to select one card and can go to the card detail.

OracleDetailViewController - This screen display the card image and text. You can also save that particular card as your favorite or share it.

FavoritesViewController - Displays a list of your favorite cards.

OnboardingViewController - Only shows on the first app open, explain how the app works.

OracleDetailViewController - Displays an card overlay explainig a little bit more about how that particular deck works.

The API is custom and is created using firebase.

# How to build

To build you need cocoapods installed, the version used here is 1.10.1. 
Go to the project folder in the terminal and type pod install. Then open the .xcworspace generated.

# Requirements

Xcode 12
Swift 5
