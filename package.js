Package.describe({
  name: 'vladejs:richarea',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'Enables Markdown on <textarea> fields',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/vladejs/richarea.git',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1');
  
  api.use('coffeescript');
  api.use('markdown');
  api.use('reactive-var');
  api.use('templating');

  api.addFiles('client/richarea.html', 'client');
  api.addFiles('client/richarea.coffee', 'client');

  api.export('Richarea', 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('vladejs:richarea');
  api.addFiles('richarea-tests.js');
});
