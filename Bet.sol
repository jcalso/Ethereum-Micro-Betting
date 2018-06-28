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
    Player1 = msg.sender;
}

 modifier condition(bool _condition) {
     require(_condition);
     _;
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

event Player1Win();
event Player2Win();
event Cancelled();
event BetPlaced();

//The number you enter in the odds field gives your opponent 1 to _odds odds;
function placeBet(uint _odds, uint _wager) {
    odds = _odds;
    wager = _wager;
    Player1 = msg.sender;
}
function cancel(){
    
}
function confirmBet(){
    Player2 = msg.sender;
}
//Deposit a stake that locks until both players agree to a result
//require that the stake is greater than the odds * wager...




function confirmWinnerP1(){
    
}
function confirmWinnerP2(){
    
}

function payWinner(){
    
}


//If player 1 wins, both parties confirm that player1 is the winner

//If player 2 wins, both parties confirm that player2 is the winner

//transfer funds accordingly
}


