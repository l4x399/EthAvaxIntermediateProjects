import {useState, useEffect} from "react";
import {ethers} from "ethers";
import 'bootstrap/dist/css/bootstrap.css';
import atm_abi from "../artifacts/contracts/Assessment.sol/Assessment.json";

export default function HomePage() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [atm, setATM] = useState(undefined);
  const [balance, setBalance] = useState(undefined);
  const [depositAmount, setDepositAmount] = useState(undefined);
  const [withdrawAmount, setWithdrawAmount] = useState(undefined);
  const [multiplyAmount, setMultiplyAmount] = useState(undefined);
  const [divideAmount, setDivideAmount] = useState(undefined);

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const atmABI = atm_abi.abi;

  const getWallet = async() => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const account = await ethWallet.request({method: "eth_accounts"});
      handleAccount(account);
    }
  }

  const handleAccount = (account) => {
    if (account) {
      console.log ("Account connected: ", account);
      setAccount(account);
    }
    else {
      console.log("No account found");
    }
  }

  const connectAccount = async() => {
    if (!ethWallet) {
      alert('MetaMask wallet is required to connect');
      return;
    }
  
    const accounts = await ethWallet.request({ method: 'eth_requestAccounts' });
    handleAccount(accounts);
    
    // once wallet is set we can get a reference to our deployed contract
    getATMContract();
  };

  const getATMContract = () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const atmContract = new ethers.Contract(contractAddress, atmABI, signer);
 
    setATM(atmContract);
  }

  const getBalance = async() => {
    if (atm) {
      setBalance((await atm.getBalance()).toNumber());
    }
  }

  const deposit = async() => {
    if (atm) {
      let tx = await atm.deposit(depositAmount);
      await tx.wait()
      getBalance();
    }
  }

  const withdraw = async() => {
    if (atm) {
      let tx = await atm.withdraw(withdrawAmount);
      await tx.wait()
      getBalance();
    }
  }

  const multiply = async() => {
    if (atm) {
      let tx = await atm.multiply(multiplyAmount);
      await tx.wait()
      getBalance();
    }
  }

  const divide = async() => {
    if (atm) {
      let tx = await atm.divide(divideAmount);
      await tx.wait()
      getBalance();
    }
  }

  const initUser = () => {
    // Check to see if user has Metamask
    if (!ethWallet) {
      return <p>Please install Metamask in order to use this ATM.</p>
    }

    // Check to see if user is connected. If not, connect to their account
    if (!account) {
      return <button onClick={connectAccount} className="btn btn-primary">Please connect your Metamask wallet</button>
    }

    if (balance == undefined) {
      getBalance();
    }

    return (
      <>
      <div>
        <p>Your Account: {account}</p>
        <p>Your Balance: {balance}</p>
        <div className="form-group">
          <label>Deposit Amount: </label>
          <input type="number" className="form-control" onChange={(e) => setDepositAmount(e.target.value)} />
        </div>
        <button onClick={deposit} className="btn btn-primary mr-2">Deposit</button>
        <div className="form-group">
          <label>Withdraw Amount: </label>
          <input type="number" className="form-control" onChange={(e) => setWithdrawAmount(e.target.value)} />
        </div>
        <button onClick={withdraw} className="btn btn-danger">Withdraw</button>
        <div className="form-group">
          <label>Multiply Amount: </label>
          <input type="number" className="form-control" onChange={(e) => setMultiplyAmount(e.target.value)} />
        </div>
        <button onClick={multiply} className="btn btn-primary">Multiply</button>
        <div className="form-group">
          <label>Divide Amount: </label>
          <input type="number" className="form-control" onChange={(e) => setDivideAmount(e.target.value)} />
        </div>
        <button onClick={divide} className="btn btn-danger">Divide</button>
      </div>
      </>
    )
  }

  useEffect(() => {getWallet();}, []);

  return (
    <>
    <main className="container">
      <div className="row mb-3">
      <div className="col-sm-12 primarycolor">
        <h1 className="pb-2 mt-5 mb-2 border-bottom">Hello</h1>
        <p className="lead">Welcome to Metacrafters ATM Calculator.</p>
      </div>
      </div>
      {initUser()}
      <div className="footer-copyright text-center py-3">
        <div></div>
      </div>
    </main>
    </>
  )
}
