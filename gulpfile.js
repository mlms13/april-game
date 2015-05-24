var gulp = require('gulp'),
    nodeStatic = require('node-static');

var path = {
  lib: {
    all: ['./node_modules/pixi.js/bin/pixi.js'],
    dest: './bin/lib/'
  },
  html: {
    all: ['./web/**/*.html'],
    dest: './bin'
  },
  assets: {
    all: ['./assets/**/*'],
    dest: './bin/assets'
  },
  dest: './bin'
};

gulp.task('copy:lib', function () {
  return gulp.src(path.lib.all)
    .pipe(gulp.dest(path.lib.dest));
});

gulp.task('copy:html', function () {
  return gulp.src(path.html.all)
    .pipe(gulp.dest(path.html.dest));
});

gulp.task('copy:assets', function () {
  return gulp.src(path.assets.all)
    .pipe(gulp.dest(path.assets.dest));
});

gulp.task('watch', function () {
  gulp.watch(path.lib.all, ['copy:html']);
  gulp.watch(path.html.all, ['copy:html']);
  gulp.watch(path.assets.all, ['copy:assets']);
});

gulp.task('server', function (cb) {
  var file = new nodeStatic.Server(path.dest);

  require('http').createServer(function (req, res) {
    req.addListener('end', function () {
      file.serve(req, res);
    }).resume();
  }).listen(4000, cb);
});

gulp.task('default', ['copy:lib', 'copy:html', 'copy:assets', 'server', 'watch']);
