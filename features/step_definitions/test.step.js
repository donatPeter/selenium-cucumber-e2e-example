// const expect = require('jest');
const { expect } = require('chai');
const { Given, When, Then } = require('cucumber');
const { By, until } = require('selenium-webdriver');
const driver = require('../utils/driver');


Given('open the {string} URL', async (url) => {
  return driver.get(url);
});

When('I click on the HTML element with {string} ID', async (id) => {
  await driver.wait(until.elementLocated(By.id(id)), 10000, 'Could not locate the child element within the time specified');
  return driver.findElement(By.id(id)).click();
});

Then('it navigates to the {string} URL', async (url) => {
  const currURL = await driver.getCurrentUrl();
  expect(currURL).to.equal(url);
});
