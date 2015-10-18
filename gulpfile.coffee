gulp = require "gulp"
mocha = require "gulp-mocha"

gulp.task "test", ->
  require "espower-coffee/guess"
  gulp.src("test/**/*.coffee")
    .pipe(mocha())

gulp.task "watch", ->
  gulp.watch(["src/**", "test/**"], ["test"])
