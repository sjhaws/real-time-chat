import axios from 'axios';
import { setFlash } from './flash';
import { setHeaders } from './headers';

export const addMessage = (message) => {
  return {
    type: 'ADD_MESSAGE',
    message,
  }
}

export const fetchMessages = () => {
  return dispatch => {
    axios.get('/api/messages')
      .then(res => {
        dispatch({ type: 'FETCH_MESSAGES', messages: res.data, headers: res.headers });
      })
      .catch(err => {
        dispatch(setFlash('Error getting messages', 'red'));
        dispatch(setHeaders(err.headers));
      })
  }
}