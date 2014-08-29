PinkiSchema = new SimpleSchema
	userId:
		type: String
	timeLocked:
		type: Date
	complete:
		type: Boolean
		defaultValue: false
	timeCompleted:
		type: Date

PinkisSchema = new SimpleSchema
	creatorUserId:
		type: String
		autoValue: ->
			if this.isInsert
				Meteor.userId()
			else
				this.unset()
		optional: true
	timeCreated:
		type: Date
		autoValue: ->
			if this.isInsert
				new Date
			else
				this.unset()
		optional: true
	description:
		type: String
	pinkisLocked:
		type: [PinkisSchema]
		optional: true

@Pinkis = new Meteor.Collection 'pinkis'
Pinkis.attachSchema PinkisSchema

Pinkis.allow
	insert: (userId, doc, field, name) -> true
	update: (userId, doc) -> true
	remove: (userId, doc) -> true

