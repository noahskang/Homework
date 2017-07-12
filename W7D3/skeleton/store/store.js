import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import combineReducers from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(combineReducers);
};

export default configureStore;
