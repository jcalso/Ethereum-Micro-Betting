pragma solidity ^0.4.22;

contract Bet{
    uint public wager;
    uint public stake;
    uint public odds;
    
    address public Player1;
    address public Player2;
    
    enum State{Created, Locked, Inactive}

    State public state1;
    State public state2;
    
constructor() public payable {
    Player1 = msg.sender
}


modifier onlyPlayer1(){
    require(msg.sender == Player1);
    _;
}
modifier onlyPlayer2(){
    require(msg.sender == Player2);
    _;
}
modifier inState1(State _state1){
    require(state1 == _state1);
    _;
}
modifier inState2(State _state2){
    require(state2 == _state2);
    _;
}

//Determine odds
//Determine Wager
//Deposit a stake that locks until both players agree to a result
//require that the stake is greater than the odds * wager...
function cancel()

function confirmWinner()


//If player 1 wins, both parties confirm that player1 is the winner

//If player 2 wins, both parties confirm that player2 is the winner

//transfer funds accordingly
}


