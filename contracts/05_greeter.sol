/* 
	The following is an extremely basic example of a solidity contract. 
	It takes a string upon creation and then repeats it when greet() is called.
*/

contract Greeter         // The contract definition. A constructor of the same name will be automatically called on contract creation. 
{
    address creator;     // 合约创建者
    string greeting;     //欢迎词
    
    //构造函数
    function Greeter(string _greeting) public   
    {
        creator = msg.sender;
        greeting = _greeting;
    }

    //返回欢迎词
    function greet() constant returns (string)          
    {
        return greeting;
    }
    
    //返回当前块号
    function getBlockNumber() constant returns (uint) // this doesn't have anything to do with the act of greeting
    {						
        return block.number;  //全局变量，块号
    }
    
    //设置欢迎词
    function setGreeting(string _newgreeting) 
    {
        greeting = _newgreeting;
    }
    
     /**********
     Standard kill() function to recover funds ，防止用户在调用合约函数时如果发送了eth，可以用这种方式取回
     **********/
    function kill()
    { 
        if (msg.sender == creator)
            suicide(creator);  // 中止合约返回eth,也可以用函数selfdestruct(address):
    }
    
    //创建者提取合约地址上所有的eth
    function clean()
    {
        if (msg.sender == creator) 
          creator.send(this.balance); 
    }

}
