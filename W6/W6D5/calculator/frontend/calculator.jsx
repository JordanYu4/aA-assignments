import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.subtractNums.bind(this);
    this.multiplyNums = this.multiplyNums.bind(this);
    this.divideNums = this.divideNums.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    let numVal = parseInt(e.target.value) ? parseInt(e.target.value) : "";
    this.setState({num1: numVal});
  }

  setNum2(e) {
    let numVal = parseInt(e.target.value) ? parseInt(e.target.value) : "";
    this.setState({num2: numVal});
  }

  addNums(e) {
    e.preventDefault();
    let sum = this.state.num1 + this.state.num2;
    this.setState({result: sum});
  }

  subtractNums(e) {
    e.preventDefault();
    let difference = this.state.num1 - this.state.num2;
    this.setState({result: difference});
  }

  multiplyNums(e) {
    e.preventDefault();
    let product = this.state.num1 * this.state.num2;
    this.setState({result: product});
  }

  divideNums(e) {
    e.preventDefault();
    let quotient = this.state.num1 / this.state.num2;
    this.setState({result: quotient});
  }

  clear(e) {
    this.setState({num1: ''});
    this.setState({num2: ''});
  }

  render() {
    return (
      <div>
          <input onChange={this.setNum1} value={this.state.num1}/>
          <input onChange={this.setNum2} value={this.state.num2}/>
          <span> </span>
          <button onclick={this.clear}>clear</button>
          <br /><br />
          <button onClick={this.addNums}>+</button>
          <button onClick={this.subtractNums}>-</button>
          <button onClick={this.multiplyNums}>x</button>
          <button onClick={this.divideNums}>÷</button>
          <h1>{this.state.result}</h1>
      </div>
    );
  }

}

export default Calculator;
