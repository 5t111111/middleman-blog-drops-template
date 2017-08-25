const path = require('path')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const extractSass = new ExtractTextPlugin(
  {
    filename: "[name].[contenthash].css",
    disable: process.env.NODE_ENV === "development"
  }
)

module.exports = {
  entry: {
    all: path.join(__dirname, 'source/javascripts/all.js'),
    style: path.join(__dirname, 'source/stylesheets/style.scss')
  },

  resolve: {
    modules: [
      path.join(__dirname, 'source/javascripts'),
      'node_modules'
    ]
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'javascripts/[name].js'
  },

  module: {
    rules: [
      {
        test: /source\/javascripts\/.*\.js$/,
        loader: 'babel-loader',
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
        use: extractSass.extract(
          {
            use: [
              {
                loader: "css-loader"
              }, {
                loader: "sass-loader"
              }
            ],
            fallback: "style-loader"
          }
        )
      }
    ]
  },

  plugins: [
    extractSass
  ]
}
