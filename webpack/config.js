const path = require("path");

module.exports = {
  entry: "./webpack/app/main.js",
  output: {
    path: path.resolve(__dirname, "../app/assets/javascripts"),
    filename: "bundle.js",
  },
  module: {
    rules: [
      { test: /\.(js|jsx)$/, exclude: /node_modules/, loader: "babel-loader" }
    ]
  },
  watch: true,
  watchOptions: {
    aggregateTimeout: 500,
  },
};
