import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor() {
    super();
    this.state = {
      apiData: null,
      apiDataLoaded: false,
    };
  }

  componentDidMount() {
    fetch('/users').then(res => res.json()).then((jsonRes) => {
      this.setState({
        apiData: jsonRes,
        apiDataLoaded: true,
      });
    });
  }

  showQuotesOnPage() {
    return this.state.apiData.map((quote) => {
      return (
        <div className="quote" key={quote.id}>
          <p>{quote.quote}</p>
          <span className="author">{quote.name}</span>
        </div>
      );
    });
  }

  render() {
    return (
      <div className="App">
        <div>
          {(this.state.apiDataLoaded) ? this.showQuotesOnPage() : <p>Loading...</p>}
        </div>
      </div>
    );
  }
}
export default App;
