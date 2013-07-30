module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'js/index.js': 'coffee/index.coffee'

    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['coffee']
      stylesheets:
        files: ['**/*.scss']
        tasks: ['sass']

    sass:
      compile:
        files:
          'css/style.css': 'scss/style.scss'

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-sass"

  grunt.registerTask "default", ["coffee", "sass"]