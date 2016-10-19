
  window.analytics = window.analytics || []; // Create a queue, or get existing

  // A list of the methods in Analytics.js to stub.
  window.analytics.methods = ['identify', 'group', 'track',
    'page', 'pageview', 'alias', 'ready', 'on', 'once', 'off',
    'trackLink', 'trackForm', 'trackClick', 'trackSubmit'];

  // Define a factory to create stubs.
  window.analytics.factory = function(method){
    return function(){
      var args = Array.prototype.slice.call(arguments);
      args.unshift(method);
      window.analytics.push(args);
      return window.analytics;
    };
  };

  // For each of our methods, generate a queueing stub.
  for (var i = 0; i < window.analytics.methods.length; i++) {
    var key = window.analytics.methods[i];
    window.analytics[key] = window.analytics.factory(key);
  }

  // Define a method to load Analytics.js
  window.analytics.load = function(key){
    if (document.getElementById('analytics-js')) return;

    // Create an async script element based on your key.
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.id = 'analytics-js';
    script.async = true;
    script.src = ('https:' === document.location.protocol
      ? 'https://' : 'http://')
      + 'cdn.segment.io/analytics.js/v1/'
      + key + '/analytics.min.js';

    // Insert our script next to the first script element.
    var first = document.getElementsByTagName('script')[0];
    first.parentNode.insertBefore(script, first);
  };

  window.analytics.SNIPPET_VERSION = '2.0.9'; // version to track what's in the wild
  window.analytics.load('ACLMWlvkZzHKrlDBM4i3UBGaJf8FesSF'); // Load Analytics.js with our key
  window.analytics.page(); // Make the first page call to load the integrations

// accommodate Turbolinks and track page views
$(document).on('ready page:change', function() {
  analytics.page();
})

// track page views and form submissions TODO: update with our forms
$(document).on('ready page:change', function() {
  console.log('page loaded');
  analytics.page();
  analytics.trackForm($('#edit_contract'), 'Edited a contract'); // ID attribute of a form and
  analytics.trackForm($('#new_contact'), 'Generated a contract'); // a name given to the event.
})
