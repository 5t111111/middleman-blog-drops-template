var path = require('path')
var ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
  entry: {
    all: path.join(__dirname, 'source/javascripts/all.js'),
    style: path.join(__dirname, 'source/stylesheets/style.scss')
  },

  resolve: {
    root: path.join(__dirname, 'source/javascripts')
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'javascripts/[name].js'
  },

  module: {
    loaders: [
      {
        test: /source\/javascripts\/.*\.js$/,
        loader: 'babel',
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.png$/,
        loader: 'url?mimetype=image/png'
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract(
          'style',
          `css?sourceMap!sass?sourceMap&includePaths[]=${path.join(__dirname, 'node_modules')}`
        )
      }
    ]
  },

  plugins: [
    new ExtractTextPlugin('stylesheets/style.css')
  ]
}
