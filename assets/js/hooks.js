const tableHooks = require('./tables.js');
const infiniteScrollHooks = require('./infinite_scroll.js');

let Hooks = {};

/* Scroll to top when a sort_link is clicked */
Hooks.ScrollToTop = {
  mounted() {
    tableHooks.methods.autoscrollToTop();
  }
};

Hooks.InfiniteScroll = {
  mounted() {
    infiniteScrollHooks.methods.infiniteScroll(this);
  },
};

exports.hooks = Hooks;
