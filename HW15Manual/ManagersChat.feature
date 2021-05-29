Feature: Chat in Managers application
	In order to communicate with Clients
	As a Manager
	I want to be able use online chat

Background:
	Given Chat feature is exist
	And Manager exist
	And Managers application is open
	And User authorized as Manager in Managers application

@p1 @smoke
Scenario: It is possible to turn on Chat feature in Managers application
	Given Chat feature is turned off
	And There is no link to Clients list page in Managers application
	When I log out
	And I authorize as admin
	And I turn on Chat feature
	And I log out
	And I authorize as Manager
	Then Link to Clients list page displayed on page in Managers application

@p2
Scenario: It is possible to turn off Chat feature in Managers application
	Given Chat feature is turned on
	And Link to Clients list page displayed on page in Managers application
	When I log out
	And I authorize as admin
	And I turn off Chat feature
	And I log out
	And I authorize as Manager
	Then There is no link to Clients list page in Managers application

@p2
Scenario Outline: Client status identificator displayed in Chat in Managers application
	Given Chat feature is turned on
	And Client exist
	And Client is '<status>'
	When I open Chat
	Then Client status identificator '<status>' displayed in Chat in Managers application
Examples:
	| status  |
	| online  |
	| offline |

@p2 @smoke
Scenario Outline: It is possible open chat with Client by clicking Client id in Pop-up message in Managers application when Client send message
	Given Chat feature is turned on
	And Client with id '<id>' exist
	And Client with id '<id>' sent a message to Manager
	When I click on Clients id '<id>' in pop-up message in Managers application
	Then Chat with user with id '<id>' opened in Managers application
Examples:
	| id   |
	| 1323 |
	| 3232 |

@p1 @smoke
Scenario Outline: It is possible to send a message to the Client in Managers application
	Given Chat feature is turned on
	And Client exist
	And Client is '<status>'
	When I open Client list page
	And I open Chat with Client
	And I send message to Client
	Then Message sent to Client in Managers application
Examples:
	| status  |
	| online  |
	| offline |

@p1
Scenario Outline: It is possible to send a message to the Client anytime in Managers application
	Given Chat feature is turned on
	And Client exist
	When I open Client list page
	And I open Chat with Client
	And I send message to Client at '<time>'
	Then Message sent to Client in Managers application
Examples:
	| time  |
	| 00.00 |
	| 04.00 |
	| 08.00 |
	| 12.00 |
	| 16.00 |
	| 20.00 |
	| 23.59 |
	| 00.01 |

@p1 @smoke
Scenario: It is possible to recieve message from User in Managers application
	Given Chat feature is turned on
	And Client exist
	And A message from the Client to the Manager has been sent
	And I open Chat with Client
	Then Manager recieved message from User in Managers application

@p2
Scenario: Chat history is saved in Managers application
	Given Chat feature is turned on
	And Client exist
	When I open Client list page
	And I click on user
	And I send message to Client
	And I close chat
	And I click on user
	Then Previous message displayed in Chat in Managers application