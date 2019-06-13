pragma solidity >=0.4.22 <0.6.0;
contract TransactionRegister {

    struct Transaction {
        uint id;
        string description;
        string document;
        uint256 value;
        uint timestamp;
        uint accountId;
        uint accountPlanId;
    }

    event TransactionCreated(
        uint id,
        string description,
        string document,
        uint256 value,
        uint timestamp,
        uint accountId,
        uint accountPlanId
    );

    address public owner;
    mapping(uint => Transaction) public transactions;
    uint public idSequence;

    constructor() public {
        owner = msg.sender;
        idSequence = 0;
    }

    function incrementId() private {
        idSequence++;
    }

    function createTransaction(
        string memory _description,
        string memory _document,
        uint256 _value,
        uint _accountId,
        uint _accountPlanId
    ) public returns (uint)
    {
        incrementId();
        uint actualTimestamp = block.timestamp;

        Transaction memory newTransaction = Transaction({
            id: idSequence,
            description: _description,
            document: _document,
            value: _value,
            timestamp: actualTimestamp,
            accountId: _accountId,
            accountPlanId: _accountPlanId
        });

        emit TransactionCreated(
            idSequence,
            _description,
            _document,
            _value,
            actualTimestamp,
            _accountId,
            _accountPlanId
        );

        transactions[idSequence] = newTransaction;

        return idSequence;
    }
}
