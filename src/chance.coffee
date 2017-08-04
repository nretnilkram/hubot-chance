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
#   hubot flip a coin / flip coin / coin flip - Returns heads or tails
#
# Configuration:
#   HUBOT_CHANCE_INCLUDE_TEXT - Optional. If set, text will accompany the image for choose a card, flip a coin, and roll a dice.
#   HUBOT_CHANCE_HEAR - Optional. If set, bot will respond to the above command without needing to address hubot first.
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

selectCard = (msg) ->
  card = msg.random deckOfCards
  image_card_name = card.toLowerCase().replace /\s+/g, "_"
  if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
    msg.send card
  msg.send 'http://www.nretnil.com/stock/deck/' + image_card_name + '.png'

selectCoin = (msg) ->
  side = msg.random coinValues
  if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
    msg.send side
  msg.send 'http://www.nretnil.com/stock/coins/penny/' + side + '.png'

selectDi = (msg) ->
  di = msg.random diceValues
  if process.env.HUBOT_CHANCE_INCLUDE_TEXT?
    msg.send di
  msg.send 'http://www.nretnil.com/stock/di/' + di + '.png'

module.exports = (robot) ->
  robot.respond /roll di/i, (msg) ->
    selectDi msg

  robot.respond /roll( \d+)? dice/i, (msg) ->
    count = if msg.match[1]? then parseInt(msg.match[1], 10) else 1
    for i in [1..count]
      selectDi msg

  robot.respond /flip( a)? coin/i, (msg) ->
    selectCoin msg

  robot.respond /coin flip/i, (msg) ->
    selectCoin msg

  robot.respond /choose a card/i, (msg) ->
    selectCard msg

# pro feature, not added to docs since you can't conditionally document commands
  if process.env.HUBOT_CHANCE_HEAR?
    robot.hear /roll di/i, (msg) ->
      selectDi msg

    robot.hear /roll( \d+)? dice/i, (msg) ->
      count = if msg.match[1]? then parseInt(msg.match[1], 10) else 1
      for i in [1..count]
        selectDi msg

    robot.hear /flip( a)? coin/i, (msg) ->
      selectCoin msg

    robot.hear /coin flip/i, (msg) ->
      selectCoin msg

    robot.hear /choose a card/i, (msg) ->
      selectCard msg
