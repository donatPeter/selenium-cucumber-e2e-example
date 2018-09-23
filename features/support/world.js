const cucumber = require('cucumber');
const world = require('cucumber-steps');

const driver = new world.World({
  browser: 'firefox',
  headless: false,
});
driver.hook(cucumber);
