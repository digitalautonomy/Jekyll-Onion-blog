const path = require('path');

// https://webpack.js.org/configuration/
module.exports = {
  entry: {
    mobileMenu: path.join(__dirname, '_webpack', 'mobile-menu'),
  },
  output: {
    path: path.resolve(__dirname, 'assets/js'),
    filename: '[name]-bundle.js',
  },
  resolve: {
    extensions: ['.json', '.js', '.jsx'],
    modules: ['node_modules'],
  },
  module: {
    rules: [
      { test: /\.js$/, exclude: /node_modules/, loader: 'babel-loader' },
    ],
  },
};
