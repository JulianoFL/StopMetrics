const path = require(`path`);
const alias = require(`./aliases`);
const { aliasWebpack } = require('react-app-alias');

const SRC = `./src`;
const aliases = alias(SRC);
const rewireReactFastRefresh = require('react-app-rewire-fast-refresh');

const resolvedAliases = Object.fromEntries(
  Object.entries(aliases).map(([key, value]) => [key, path.resolve(__dirname, value)])
);

const options = {
  alias: resolvedAliases,
};

//module.exports = function override(config) {
//  config.ignoreWarnings = [{ message: /Failed to parse source map/ }];

//  return aliasWebpack(options)(config);
//};

/* config-overrides.js */
module.exports = function override(config, env) {
  config = rewireReactFastRefresh(config, env);

  config.ignoreWarnings = [{ message: /Failed to parse source map/ }];

  return aliasWebpack(options)(config);
  // return config;
};
