// SPDX-License-Identifier: MIT 
pragma solidity 0.8.30;


contract InventoryContract {

    struct Product{
        uint64 identify ;
        string name ;
        bool exists ;
    }
    mapping(uint64=>Product) private products ;

    event updatedProduct(uint64 indexed id,string indexed products);
    event deletedProduct(uint64 indexed id,string indexed products);
    event productNameUpdated(uint64 indexed id,string indexed newName);

    address private owner ;

    modifier onlyOwner(){
        require(msg.sender==owner,"Unauthorized");_;
    }

    constructor (){
        owner = msg.sender;
    }

    function setProduct(uint64 identify ,string memory name)external onlyOwner{
        require(!products[identify].exists ,"Already exist");
        products[identify] = Product(identify,name,true);
        emit updatedProduct(identify,name);
    }

    function getProduct(uint64 identify)external view returns(string memory){
        require(products[identify].exists,"Product does not exist");
        return products[identify].name ;
    }

    function removeProduct(uint64 identify) external onlyOwner{
        require(products[identify].exists ,"does not exist");
        products[identify].exists = false ;
        emit deletedProduct(identify,products[identify].name);
    }

    function updateProducts(uint64 identify,string memory newName)external onlyOwner{
        require(products[identify].exists,"Product does not exist");
        products[identify].name = newName ;
        emit productNameUpdated(identify,newName);
    }
}
