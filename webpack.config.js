var webpack = require("webpack");
module.exports = {
  entry: {
    bundle: './ts/app.ts',
  },
  devtool: 'inline-source-maps',
  output: {
    filename: 'public/js/[name].js',
    path: __dirname
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        loader: 'ts-loader'
      },
    ]
  },
  resolve: {
    modules: ["node_modules"],
    extensions: [".tsx", ".ts", ".js"]
  },
};
