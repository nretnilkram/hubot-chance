const chai = require('chai');
const sinon = require('sinon');
chai.use(require('sinon-chai'));

const expect = chai.expect;

describe('hubot-chance', () => {
  beforeEach(function() {
    this.robot = {
      respond: sinon.spy(),
      hear: sinon.spy()
    };
    require('../src/chance')(this.robot);
  });

  it('responds to "roll di"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('roll di');
    }));
  });

  it('responds to "roll dice"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('roll dice');
    }));
  });

  it('responds to "roll n dice"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('roll 5 dice');
    }));
  });

  it('responds to "flip coin"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('flip coin');
    }));
  });

  it('responds to "flip a coin"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('flip a coin');
    }));
  });

  it('responds to "coin flip"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('coin flip');
    }));
  });

  it('responds to "choose a card"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('choose a card');
    }));
  });

  it('responds to "pick a card"', function() {
    expect(this.robot.respond).to.have.been.calledWith(sinon.match((val) => {
      return val.test('pick a card');
    }));
  });
});