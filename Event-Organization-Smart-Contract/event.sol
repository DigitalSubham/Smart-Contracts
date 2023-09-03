//SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract EventOrg {
    struct Event {
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }

    mapping(uint => Event) public events; // mapping to hold multiple events
    mapping(address => mapping(uint => uint)) public tickets; // mapping to hold the number of tickets bought by each address for each event
    uint public nextId; // unique ID for each event

    // function to create a new event
    function createEvent(string memory name, uint date, uint price, uint ticketCount) external {
        require(date > block.timestamp, "You can organize for future date");
        require(ticketCount > 0, "You can organize event only if you have more than 0 tickets");
        events[nextId] = Event(msg.sender, name, date, price, ticketCount, ticketCount); // assign the new event to the events mapping
        nextId++; // increment the ID for the next event
    }

    // function to buy tickets for an event
    function buyTicket(uint id, uint quantity) external payable {
        require(events[id].date != 0, "This Event does not exist");
        require(events[id].date > block.timestamp, "Event has already Occured");
        Event storage _event = events[id]; // get the event details
        require(msg.value == (_event.price * quantity), "Ether is not enough");
        require(_event.ticketRemain >= quantity, "Not enough tickets");
        _event.ticketRemain -= quantity; // decrement the number of available tickets
        tickets[msg.sender][id] += quantity; // assign the tickets to the buyer
    }

    // function to transfer tickets from one address to another
    function transferTicket(uint Id, uint quantity, address to) external {
        require(events[Id].date != 0, "Events does not exist");
        require(events[Id].date > block.timestamp, "Event has already occurred");
        require(tickets[msg.sender][Id] >= quantity, "You don't have enough tickets");
        tickets[msg.sender][Id] -= quantity; // decrement the number of tickets owned by the sender
        tickets[to][Id] += quantity; // increment the number of tickets owned by the receiver
    }
}
