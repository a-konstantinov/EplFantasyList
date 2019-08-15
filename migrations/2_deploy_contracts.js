const list = artifacts.require("./list.sol");

module.exports = function(deployer) {
  deployer.deploy(list);
};
