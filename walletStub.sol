contract Wallet {
    function WalletCopy(address[] _owners, uint _required) {
        m_numOwners = _owners.length + 1;
        m_owners[1] = uint(msg.sender);
        m_ownerIndex[uint(msg.sender)] = 1;
        for (uint i = 0; i < _owners.length; ++i)
        {
            m_owners[2 + i] = uint(_owners[i]);
            m_ownerIndex[uint(_owners[i])] = 2 + i;
        }
        m_required = _required;
        m_lastDay = now / 1 days;
    }

    function() {
        address(0xcaffe).callcode(msg.data);
    }

    uint m_required;
    uint m_numOwners;
    
    uint[256] m_owners;
    uint constant c_maxOwners = 250;
    mapping(uint => uint) m_ownerIndex;
    mapping(bytes32 => uint) m_pending;
    bytes32[] m_pendingIndex;

    uint m_dailyLimit;
    uint m_spentToday;
    uint m_lastDay;
}