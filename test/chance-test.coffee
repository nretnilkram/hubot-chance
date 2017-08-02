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

	it 'responds to "roll dice"', ->
		expect(@robot.respond).to.have.been.calledWith sinon.match( (val) ->
			val.test /roll dice/
		)

	it 'responds to "roll n dice"', ->
		expect(@robot.respond).to.have.been.calledWith sinon.match( (val) ->
			val.test /roll 5 dice/
		)

	it 'responds to "flip coin"', ->
		expect(@robot.hear).to.have.been.calledWith sinon.match( (val) ->
			val.test /flip coin/
		)

	it 'responds to "flip a coin"', ->
		expect(@robot.hear).to.have.been.calledWith sinon.match( (val) ->
			val.test /flip a coin/
		)

	it 'responds to "coin flip"', ->
		expect(@robot.hear).to.have.been.calledWith sinon.match( (val) ->
			val.test /coin flip/
		)

	it 'responds to "choose a card"', ->
		expect(@robot.hear).to.have.been.calledWith sinon.match( (val) ->
			val.test /choose a card/
		)
