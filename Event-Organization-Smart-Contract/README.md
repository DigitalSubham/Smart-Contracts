# Event-Organization-Smart-Contract

This Solidity smart contract defines a contract called "EventOrg" that allows users to create events and buy and transfer tickets for those events.

The "EventOrg" contract contains a struct called "Event" that defines the details of an event, such as the 
- organizer's address
- the event name
- the date of the event
- the price of the tickets
- the total number of tickets available
- and the number of tickets remaining.

The contract also includes two mappings: 
- the first mapping allows multiple events to be created, with each event being assigned a unique ID, and 
- the second mapping keeps track of the number of tickets bought by each address for each event.

There are three functions in the contract:

- The "createEvent" function allows users to create a new event by specifying the name, date, price, and total number of tickets available.
- The "buyTicket" function allows users to buy tickets for an event by specifying the event ID and the number of tickets they want to buy. Users must also send the correct amount of Ether to purchase the tickets.
- The "transferTicket" function allows users to transfer their tickets to another address by specifying the event ID, the number of tickets they want to transfer, and the address of the recipient.  


Overall, this smart contract enables the creation and management of events and ticket sales on the Ethereum blockchain.
