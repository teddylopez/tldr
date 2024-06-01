let methods = {};

/**
 * Autoscroll leaderboard table to top after event.
 *
 */
methods.autoscrollToTop = function () {
  window.addEventListener('phx:scrollToTop', () => {
    document.querySelectorAll('table').forEach((table) => {
      table.parentElement.scrollTop = -100;
    })
  })
}

exports.methods = methods;
