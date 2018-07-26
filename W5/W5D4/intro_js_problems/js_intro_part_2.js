function titleize(nameArray, printCallback) {
  let titleized = nameArray.map((name) => {
    let nameTitle = name[0].toUpperCase() + name.slice(1);
    return `Mx. ${nameTitle} Jingleheimer Schmidt`;
  });
  return titleized.forEach(printCallback);
}

let names = ['Andy', 'Harry', 'Joel'];
function printingCallback(text) {
  console.log(text);
}
// console.log(titleize(names, printingCallback));

class Elephant {

  constructor(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
  }

  trumpets() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRR!!!!!'`);
  };

  addTrick(trick) {
    this.tricks.push(trick);
  };

  play() {
    let randomTrick = this.tricks[Math.floor(Math.random() * this.tricks.length)]
    console.log(`${this.name} is ${randomTrick}!`);
  };
}

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is galloping onwards!`);
};

let ellie = new Elephant("ellie", 24, ['playing chess', 'baking cookies']);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);
let herd = [ellie, charlie, kate, micah];

console.log(herd);
herd.forEach(Elephant.paradeHelper);

function dinerBreakfast() {
  let order = "I'd like some scrambled eggs with home fries, please.";
  function hangry(moreFood) {
    let manners = order.slice(order.length - 9);
    order = order.slice(0, order.length-9);
    order += " and " + moreFood;
    order += manners;
    return order;
  }
  return hangry;
}

let bfastOrder = dinerBreakfast();
