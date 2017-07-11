import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';



document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  store = applyMiddlewares(store, addLoggingToDispatch);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// this logger: receives store as an argument.
// logs the old state, the action, and the new state. when we call dispatch
// it also calls dispatch again.
const addLoggingToDispatch = (store)=>{
  let OGDispatch = store.dispatch;
  return (action) => {
    console.log(store.getState());
    console.log(action);
    OGDispatch(action);
    console.log(store.getState());
  };
}

// overwriting store.dispatch is an anti-pattern. So we refactor. we're going to write a generalized applyMiddlewares function that runs either a single middleware or a group of them. applymiddlewares will give the middlewares access to the store's dispatch f, as well as the action that is being dispatched.

// Step1: Turn addLoggingToDispatch into a middleware
const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach(middleware => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, {dispatch});
};
