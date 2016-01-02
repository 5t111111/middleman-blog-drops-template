var webpack = require('webpack');
var path = require('path');

module.exports = {
  entry: {
    all: './source/javascripts/all.js'
  },

  resolve: {
    root: path.join(__dirname, 'source/javascripts'),
    modulesDirectories: [
      path.join(__dirname, "node_modules"),
      path.join(__dirname, "source/stylesheets")
    ],
    extensions: ['', '.js', '.scss']
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'javascripts/[name].js'
  },

  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
      {
        test   : /\.scss$/,
        loaders: ['style', 'css?sourceMap', 'sass?sourceMap']
      },
      {
        test: /\.png$/,
        loader: "url-loader?mimetype=image/png"
      }
    ]
  },

  sassLoader: {
    includePaths: [path.join(__dirname, "node_modules")]
  }
};
