export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';

export const receiveSearchGiphys = (giphys) => {
  return { type: RECEIVE_SEARCH_GIPHYS, giphys};
};
