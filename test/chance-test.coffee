chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-chance', ->
	beforeEach ->
		@robot =
			respond: sinon.spy()
			hear: sinon.spy()

		require('../src/chance')(@robot)

	it 'responds to "roll di"', ->
		expect(@robot.respond).to.have.been.calledWith sinon.match( (val) ->
			val.test /roll di/
		)
