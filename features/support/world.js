const cucumber = require('cucumber');
const world = require('cucumber-steps');

const driver = new world.World();
driver.hook(cucumber);
