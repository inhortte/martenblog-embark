pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;

contract Poems {
  struct Poem {
    string poem;
    address author;
    address origin;
    uint64 timestamp;
    uint256 value;
  }
  struct Author {
    string name;
    address origin;
    bool exists;
  }
  address public owner;
  Author[] private authors;
  Poem[] private poems;
  mapping(address => Author) public authorsByOrigin;
  mapping(address => Poem[]) public poemsByAuthor;
  constructor() public {
    owner = msg.sender;
  }
  function newAuthor(address origin, string name) returns (string) {
    require(
	    !authorsByOrigin[origin].exists,
	    "The author already has a part in this quantum universe, vole."
    );
    Author memory buddingAuthor = Author({
      origin: origin,
      name: name,
      exists: true
    }); 
    authors.push(buddingAuthor);
    authorsByOrigin[origin] = buddingAuthor;
    return name;
  }
  function setAuthorName(address origin, string name) returns (string) {
    require(authorsByOrigin[origin].exists, "The author must have entered this quantum universe first, vole.");
    Author storage author = authorsByOrigin[origin];
    author.name = name;
    return name;
  }
  function getAuthors() returns (bytes[53]) {
    uint8 authorCount = uint8(authors.length);
    bytes[53] storage authorNames;
    uint8 i = 0;
    while(i < authorCount) {
      authorNames[i] = bytes(authors[i].name);
      i++;
    }
    return authorNames;
  }
}

