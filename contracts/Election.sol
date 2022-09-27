// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

contract Election {

    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;
    string public name1;

    event Log(string value); 
    event Log1(uint value); 
    event Log2(address value);
    event votedEvent(string mine,uint indexed _candidateId);

    constructor () {
        addCandidate("Narendra Modi");
        addCandidate("Manmohan singh");
    }

    function addCandidate(string memory _name) private {
        ++candidatesCount;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    function vote(uint _candidateId) public{
        require (!voters[msg.sender]);

        require(_candidateId >0 && _candidateId <= candidatesCount);

        //require block.timestamp >= candidates.createdTime +30)

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount++;

        emit votedEvent("voted right now", _candidateId);

    }

    function winner() public returns(string memory){
        uint i;
        for(i=0; i<=1; i++) {
           // emit Log2(candidates); 
            if(candidates[i].voteCount > 2) {
                name1 = candidates[i].name;
                return name1;
             }
        }
        return "No one is winner";         
    }

}