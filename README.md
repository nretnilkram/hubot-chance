# hubot-chance

A hubot script that returns based on chance

See [`src/chance.js`](src/chance.js) for full documentation.

## Installation

In hubot project repo, run:

`npm install https://github.com/nretnilkram/hubot-chance.git --save`

Then add **hubot-chance** to your `external-scripts.json`:

```json
["hubot-chance"]
```

## Heroku Configuration

```
heroku config:set HUBOT_CHANCE_HEAR=true
heroku config:set HUBOT_CHANCE_INCLUDE_TEXT=true
```

## Sample Interaction

```
user1>> hubot roll di
hubot>> 6
```
```
user1>> hubot roll dice
hubot>> 6
hubot>> 3
```
```
user1>> hubot roll 5 dice
hubot>> 6
hubot>> 6
hubot>> 5
hubot>> 3
hubot>> 1
```
```
user1>> hubot flip a coin
hubot>> tails
```
```
user1>> hubot flip coin
hubot>> heads
```
```
user1>> hubot coin flip
hubot>> heads
```

```
user1>> hubot choose a card
hubot>> 4 of Spades
```
