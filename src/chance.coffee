# Description:
#   Get change results from hubot
#
# Dependencies:
#   None
#
# Commands:
#   hubot roll di - Returns number between 1 and 6
#   hubot roll dice - Returns 2 numbers between 1 and 6
#   hubot roll n dice - Returns n numbers between 1 and 6
#   flip a coin / flip coin / coin flip - Returns heads or tails
#
# Author:
#   nrentnilkram

diceValues = ['1', '2', '3', '4', '5', '6']
coinValues = ['heads', 'tails']

module.exports = (robot) ->
  robot.respond /roll di/i, (msg) ->
    msg.send msg.random diceValues

  robot.respond /roll( \d+)? dice/i, (msg) ->
    count = if msg.match[1]? then parseInt(msg.match[1], 10) else 1
    msg.send msg.random diceValues for i in [1..count]

  robot.hear /flip( a)? coin/i, (msg) ->
    msg.send msg.random coinValues

  robot.hear /coin flip/i, (msg) ->
    msg.send msg.random coinValues
