# Description:
#   Play Updated Cards Against Humanity in Hubot
#
# Dependencies:
#   None
#
# Commands:
#   hubot roll di - Returns number between 1 and 6
#   hubot roll dice - Returns 2 numbers between 1 and 6
#   hubot roll n dice - Returns n numbers between 1 and 6
#
# Author:
#   nrentnilkram

module.exports = (robot) ->
  robot.respond /roll di( \d+)?/i, (msg) ->
    count = if msg.match[1]? then parseInt(msg.match[1], 10) else 1
    msg.send msg.random cards['whiteCards'] for i in [1..count]
