pragma solidity ^0.4.22;

contract Bet{
    uint public wager;
    uint public odds;
    
    address public Player1;
    addres public Player2;
    
    enum State{Created, Locked, Inactive}
    State public state;
    
}

//Determine odds
//Determine Wager
//Deposit a stake that locks until both players agree to a result
//require that the stake is greater than the odds * wager

//If player 1 wins, both parties confirm that player1 is the winner

//If player 2 wins, both parties confirm that player2 is the winner

//transfer funds accordingly



