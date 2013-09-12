# grut config
module.exports = (grunt)->
	grunt.initConfig
		pkg: "<json:package.json>"
		coffee:
			app:
				files:
					"app.js": "app.coffee"
				options:
					bare: true
			routes:
				files:
					"routes/index.js": "routes/index.coffee"
					"routes/show.js": "routes/show.coffee"
					"routes/api.js": "routes/api.coffee"
				options:
					bare: true
			client:
				files:
					"public/javascripts/viewer.js": "viewer.coffee"
				options:
					bare: true
		copy:
			javascripts:
				files:
					"public/javascripts/jquery.js": "bower_components/jquery/jquery.min.js"
					"public/javascripts/knockout.js": "bower_components/knockout/knockout.js"
					"public/javascripts/jquery.transit.js": "bower_components/jquery.transit/jquery.transit.js"
		uglify:
			release:
				files: 
					"public/javascripts/jquery.js": "public/javascripts/jquery.js"
					"public/javascripts/jquery.transit.js": "public/javascripts/jquery.transit.js"
					"public/javascripts/knockout.js": "public/javascripts/knockout.js"
					"public/javascripts/viewer.js": "public/javascripts/viewer.js"

		grunt.loadNpmTasks "grunt-contrib-coffee"
		grunt.loadNpmTasks "grunt-contrib-copy"
		grunt.loadNpmTasks "grunt-contrib-uglify"

		grunt.registerTask "b", ["coffee", "copy"]
		