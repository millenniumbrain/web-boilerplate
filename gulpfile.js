var gulp        = require('gulp');
var browserify  = require('browserify');
var source      = require('vinyl-source-stream'); //to 'rename' your resulting file
var uglify      = require('gulp-uglify');
var buffer      = require('vinyl-buffer'); // to transform the browserify results into a 'stream'
var sourcemaps  = require('gulp-sourcemaps');
var watchify    = require('watchify');
var tsify       = require ('tsify');

gulp.task("watch", function() {
  var b = browserify({ debug: true, cache: {}, packageCache: {} });

  b.add('public/ts/main.ts');
  b.plugin(tsify)
  b.plugin(watchify);

  b.on('update', bundle);
  bundle();

  function bundle() {
    b.bundle()
      .on('error', function (error) { console.error(error.toString()); })
      .pipe(source('app.js'))
      .pipe(buffer())
      .pipe(sourcemaps.init({loadMaps: true,debug: true}))
     // .pipe(uglify())
      .pipe(sourcemaps.write("./"))
      .pipe(gulp.dest('public/js/dist'));
  }
});

gulp.task("default", function() {
});
