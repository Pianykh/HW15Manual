Feature: Chat in Clients application
	In order to communicate with Manager
	As a Client
	I want to be able use online chat

Background:
	Given Chat feature is exist
	And Client exist
	And Clients application is open
	And User authorized as Client in Clients application

@p1 @smoke
Scenario: It is possible to turn on Chat feature in Clients application
	Given Chat feature is turned off
	And There is no Chat icon on page in Clients application
	When I log out
	And I authorize as admin
	And I turn on Chat feature
	And I log out
	And I authorize as Client
	Then Chat icon displayed on page in Clients application

@p2
Scenario: It is possible to turn off Chat feature in Clients application
	Given Chat feature is turned on
	And Chat icon displayed on page in Clients application
	When I log out
	And I authorize as admin
	And I turn off Chat feature
	And I log out
	And I authorize as Client
	Then There is no Chat icon on page in Clients application

@p2
Scenario Outline: Manager status identificator displayed in Chat in Clients application
	Given Chat feature is turned on
	And Manager exist
	And Manager is '<status>'
	When I open Chat
	Then Manager status identificator '<status>' displayed in Chat in Clients application
Examples:
	| status  |
	| online  |
	| offline |

@p1 @smoke
Scenario Outline: It is possible to send message to Manager in Clients application
	Given Chat feature is turned on
	And Manager exist
	And Manager is '<status>'
	When I open Chat
	And I send message to Manager
	Then Message sent to Manager in Clients application
	Examples: 
	| status  |
	| online  |
	| offline |

@p1
Scenario Outline: It is possible to send message to Manager anytimу in Clients application
	Given Chat feature is turned on
	And Manager exist
	When I open Chat
	And I Send message to Manager at '<time>'
	Then Message sent to Manager in Clients application
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
Scenario: It is possible to recieve message from Manager in Clients application
	Given Chat feature is turned on
	And Manager exist
	And A message from the manager to the client has been sent
	And I open Chat
	Then User recieved message from Manager in Clients application

@p2
Scenario: Notification displayed in Clients application when manager send message to Client
	Given Chat feature is turned on
	And Manager exist
	And A message from the manager to the client has been sent
	Then Notification displayed in Clients application

@p2
Scenario: Chat history is saved in Clients application
	Given Chat feature is turned on
	And Manager exist
	When I open Chat
	And I send message to Manager
	And I close chat
	And I open chat
	Then Previous message displayed in Chat in Clients application