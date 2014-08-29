Router.map ->
	@route 'home',
		path: '/'
		waitOn: -> Meteor.subscribe 'allPinkis'
		data: -> pinkis: Pinkis.find()
	@route 'createPinki'