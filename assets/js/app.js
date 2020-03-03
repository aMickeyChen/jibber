// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import 'phoenix_html'

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import {Socket} from 'phoenix'
import LiveSocket from 'phoenix_live_view'

import css from '../css/app.css'



let Hooks = {};
Hooks.ConversationPanel = {
  mounted() {
    this.el.parentElement.parentElement.scrollTop =
        this.el.parentElement.parentElement.scrollHeight;
  },
  updated() {
    this.el.parentElement.parentElement.scrollTop =
        this.el.parentElement.parentElement.scrollHeight;
  }
};

let csrfToken =
    document.querySelector('meta[name=\'csrf-token\']').getAttribute('content');
let liveSocket = new LiveSocket(
    '/live', Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
liveSocket.connect()