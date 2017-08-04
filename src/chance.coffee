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
# Configuration:
#   HUBOT_CHANCE_INCLUDE_TEXT - Optional. If set, text will accompany the image for choose a card, flip a coin, and roll a dice.
#
# Author:
#   nrentnilkram

diceValues = ['1', '2', '3', '4', '5', '6']
coinValues = ['heads', 'tails']
suite = ['Hearts','Diamonds','Spades','Clubs']
value = ['Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King']
deckOfCards = []

for x in suite
  for y in value
    deckOfCards.push y + ' of ' + x

module.exports = (robot) ->
  robot.respond /roll di/i, (msg) ->
    di = msg.random diceValues
    if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
      msg.send di
    msg.send msg.send 'http://www.nretnil.com/stock/di/' + di + '.png'

  robot.respond /roll( \d+)? dice/i, (msg) ->
    count = if msg.match[1]? then parseInt(msg.match[1], 10) else 1
    for i in [1..count]
      di = msg.random diceValues
      if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
        msg.send di
      msg.send msg.send 'http://www.nretnil.com/stock/di/' + di + '.png'

  robot.hear /flip( a)? coin/i, (msg) ->
    side = msg.random coinValues
    if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
      msg.send side
    msg.send msg.send 'http://www.nretnil.com/stock/coins/penny/' + side + '.png'

  robot.hear /coin flip/i, (msg) ->
    side = msg.random coinValues
    if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
      msg.send side
    msg.send msg.send 'http://www.nretnil.com/stock/coins/penny/' + side + '.png'

  robot.hear /choose a card/i, (msg) ->
    card = msg.random deckOfCards
    image_card_name = card.toLowerCase().replace /\s+/g, "_"
    if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
      msg.send card
    msg.send 'http://www.nretnil.com/stock/deck/' + image_card_name + '.png'
