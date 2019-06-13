const Migrations = artifacts.require("Migrations");
const TransactionRegister = artifacts.require("TransactionRegister");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(TransactionRegister);
};
