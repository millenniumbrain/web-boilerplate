const webpack = require("webpack");
const path = require("path");
const CleanWebpackPlugin = require("clean-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");


const pathsToClean = [
  "public/js/*.*"
];

const cleanOptions = {
  root: __dirname
};

module.exports = {
  mode: 'production',
  entry: {
    app: './ts/app.ts',
    dashboard: './ts/dashboard.ts'
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, "public/js")
  },
  module: {
    rules: [
      {
        test: /\.ts|\.tsx?$/,
        loader: 'ts-loader'
      },
    ]
  },
  resolve: {
    modules: ["node_modules"],
    extensions: [".tsx", ".ts", ".js"]
  },
  plugins: [
    new CleanWebpackPlugin(pathsToClean, cleanOptions),
    new UglifyJsPlugin()
  ]
};
