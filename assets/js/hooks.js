const tableHooks = require('./tables.js');
const infiniteScrollHooks = require('./infinite_scroll.js');
const appThemeHooks = require('./app_themes')

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

Hooks.AppThemes = {
  mounted() {
    appThemeHooks.methods.initialThemeCheck();
    appThemeHooks.methods.toggleTheme(this);
  },
}

exports.hooks = Hooks;
