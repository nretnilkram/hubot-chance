// Description:
//   Get change results from hubot
//
// Dependencies:
//   None
//
// Commands:
//   hubot roll di - Returns number between 1 and 6
//   hubot roll dice - Returns 2 numbers between 1 and 6
//   hubot roll n dice - Returns n numbers between 1 and 6
//   hubot flip a coin / flip coin / coin flip - Returns heads or tails
//   hubot choose / pick a card - Returns a random playing card from a full deck each time.
//
// Configuration:
//   HUBOT_CHANCE_INCLUDE_TEXT - Optional. If set, text will accompany the image for choose a card, flip a coin, and roll a dice.
//   HUBOT_CHANCE_HEAR - Optional. If set, bot will respond to the above command without needing to address hubot first.
//
// Author:
//   nrentnilkram

const diceValues = ['1', '2', '3', '4', '5', '6'];
const coinValues = ['heads', 'tails'];
const suite = ['Hearts', 'Diamonds', 'Spades', 'Clubs'];
const value = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King'];
const deckOfCards = [];

for (const x of suite) {
  for (const y of value) {
    deckOfCards.push(y + ' of ' + x);
  }
}

const selectCard = (msg) => {
  const card = msg.random(deckOfCards);
  const imageCardName = card.toLowerCase().replace(/\s+/g, "_");
  if (process.env.HUBOT_CHANCE_INCLUDE_TEXT) {
    msg.send(card);
  }
  msg.send('http://www.nretnil.com/stock/deck/' + imageCardName + '.png');
};

const selectCoin = (msg) => {
  const side = msg.random(coinValues);
  if (process.env.HUBOT_CHANCE_INCLUDE_TEXT) {
    msg.send(side);
  }
  msg.send('http://www.nretnil.com/stock/coins/penny/' + side + '.png');
};

const selectDi = (msg) => {
  const di = msg.random(diceValues);
  if (process.env.HUBOT_CHANCE_INCLUDE_TEXT) {
    msg.send(di);
  }
  msg.send('http://www.nretnil.com/stock/di/' + di + '.png');
};

export default (robot) => {
  robot.respond(/roll di/i, (msg) => {
    selectDi(msg);
  });

  robot.respond(/roll( \d+)? dice/i, (msg) => {
    const count = msg.match[1] ? parseInt(msg.match[1], 10) : 1;
    for (let i = 1; i <= count; i++) {
      selectDi(msg);
    }
  });

  robot.respond(/flip( a)? coin/i, (msg) => {
    selectCoin(msg);
  });

  robot.respond(/coin flip/i, (msg) => {
    selectCoin(msg);
  });

  robot.respond(/(choose|pick) a card/i, (msg) => {
    selectCard(msg);
  });

  // Optional feature, not added to docs since you can't conditionally document commands
  if (process.env.HUBOT_CHANCE_HEAR === "true") {
    robot.hear(/^roll di/i, (msg) => {
      selectDi(msg);
    });

    robot.hear(/^roll( \d+)? dice/i, (msg) => {
      const count = msg.match[1] ? parseInt(msg.match[1], 10) : 1;
      for (let i = 1; i <= count; i++) {
        selectDi(msg);
      }
    });

    robot.hear(/^flip( a)? coin/i, (msg) => {
      selectCoin(msg);
    });

    robot.hear(/^coin flip/i, (msg) => {
      selectCoin(msg);
    });

    robot.hear(/^(choose|pick) a card/i, (msg) => {
      selectCard(msg);
    });
  }
};