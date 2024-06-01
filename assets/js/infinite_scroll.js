/**
 * Infinite scroll functionality
 *
 */

let methods = {};

// Previous method for reference:
methods.infiniteScroll = function ($this) {
  $this.observer = new IntersectionObserver((entries) => {
    const entry = entries[0];
    if (entry.isIntersecting) {
      $this.pushEvent('load-more');
    }
  }, {
    threshold: 0.0, // Trigger the callback as soon as any part of the target is visible.
  });

  $this.observer.observe($this.el);
}

methods.disconnect = function ($this) {
  $this.observer.disconnect();
}

methods.progressBar = function ($this) {
  window.addEventListener(`phx:progressBar`, (e) => {
    $this.el.style.width = `${e.detail.scrolling_avg + 1.0}%`;
  })
}

exports.methods = methods;
