pragma solidity ^0.4.17;
 
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Bet.sol";

//To Do: figure out how to test enum types
contract TestBet{
    Bet bet = Bet(DeployedAddresses.Bet());

    function testInitiateBet() public {
        address expected = this;
     
        bet.initiateBet(1);

        address my_address = bet.Player1();
        uint wager = bet.wager();
        uint expectedWager = 1;
        //Bet.State state = bet.state;
        //Bet.State expectedState = Bet.State.Created;

        Assert.equal(expected, my_address, "Address of Player 1 should be set");
        Assert.equal(wager, expectedWager, "Wager should be set");
        //Assert.equal(expectedState, state, "State should be Created");
    }

    //Note: I guess the function below can't be done, so TO DO: look into javascript testing
   
   /* function testConfirmBet() public{
        address expected = msg.sender;

        bet.initiateBet(1);
        bet.confirmBet();

        address my_address = bet.Player2();
   
        Assert.equal(expected, my_address, "Address of Player2 should be set");
    }*/

}
