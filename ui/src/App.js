import './App.css';
import React, { Component } from 'react';

class App extends Component {
    constructor(props) {
        super(props);
        this.state = {healthCheck: "Don't know"};
    }

    componentDidMount() {
        const url = `${process.env.REACT_APP_API_URL}/healthCheck`;
        fetch(url)
        .then(res => res.json())
        .then(
            (result) => {
            this.setState({
                healthCheck: result.status
            });
            },
            // Note: it's important to handle errors here
            // instead of a catch() block so that we don't swallow
            // exceptions from actual bugs in components.
            (error) => {
            this.setState({
                error
            });
            }
        )
    }

    render() {
        const healthCheck = this.state.healthCheck;

        return (
          <div className="App">
            <header className="App-header">
              Server HealthCheck status: {healthCheck}
            </header>
          </div>
        );
    }
}

export default App;
