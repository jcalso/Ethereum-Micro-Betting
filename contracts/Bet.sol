pragma solidity ^0.4.22;

contract Bet{
    uint public wager;
    //uint public stake;
   // uint public odds;
    
    address public Player1;
    address public Player2;
    address public Winner; 
    address public Loser;
    
    enum State{ Created, Locked, Inactive }

    State public state;
    
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
modifier inState(State _state){
    require(state == _state);
    _;
}

event Player1Win();
event Player2Win();
event Cancelled();
event BetPlaced();
event PayWinner();

//The number you enter in the odds field gives your opponent 1 to _odds odds;
function placeBet( uint _wager)public{
    //odds = _odds;
    wager = _wager;
    Player1 = msg.sender;
    
    state = State.Created;
}
function cancel() public onlyPlayer1{
    require(state == State.Created);
    emit Cancelled();
    state= State.Inactive;
}
function confirmBet()public {
    emit BetPlaced();
    require(msg.sender != Player1);
    Player2 = msg.sender;
    
    state = State.Locked;
}

//TO DO:
//Deposit a stake that locks until both players agree to a result
//require that the stake is greater than the odds * wager...

function confirmWinnerP1()public onlyPlayer2 inState(State.Locked){
    Winner = Player1;
    Loser = Player2;
    emit Player1Win();
}

function confirmWinnerP2() public onlyPlayer1 inState(State.Locked){
    Winner = Player2;
    Loser = Player1;
    emit Player2Win();
}

function pay()public payable{
    emit PayWinner();
    
    state = State.Inactive;
    
    Loser.transfer(wager);
    Winner.transfer(address(this).balance);
}

}
