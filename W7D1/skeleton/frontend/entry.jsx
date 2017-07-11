import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import store from './store';
import selectCurrency from './actions';

window.selectCurrency = selectCurrency;

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Widget store={store} />, document.getElementById('root'));
  // we add store as a prop for Widgets.
  // store is imported from ./store
});
