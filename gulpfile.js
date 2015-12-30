var gulp        = require('gulp');
var coffeeify   = require('coffeeify');
var browserify  = require('browserify');
var source      = require('vinyl-source-stream'); //to 'rename' your resulting file
var uglify      = require('gulp-uglify');
var buffer      = require('vinyl-buffer'); // to transform the browserify results into a 'stream'
var sourcemaps  = require('gulp-sourcemaps');

gulp.task("brew-coffee", function() {
  var b =  browserify({
    debug: true,
    extensions: [".coffee"],
  });

  b.transform(coffeeify, {
    bare: false,
    header: true
  });

  var files_dir = 'public/coffee/';

  var files = [
    files_dir + 'index.coffee'
  ];

  b.add(files)

  b.bundle()
    .pipe(source('app.js'))
    .pipe(buffer())
    .pipe(sourcemaps.init({loadMaps: true,debug: true}))
    .pipe(uglify()).pipe(sourcemaps.write("./"))
    .pipe(gulp.dest('public/js/dist'));

});

gulp.task("default", function() {
});
