const obj = {
  name: "Earl Watts"
};

function greet(msg){
  console.log(`${msg}: ${this.name}`);
}

greet.apply(obj, ["hello"]);

method.apply(obj, parameter)

class Bicycle {
  constructor(model, color){
    this.model = model;
    this.color = color;
  }

  action(){
    return "rolls along";

  }
  ride(){
    console.log(
      `The`${this.color} ${this.model}
      goes "whoosh" and ${this.action()}!`
    )};`
    )
  }

  static parade(){
    Bicycle.funBicycles.forEach(bike => bike.ride());
  }
}

const cruiser = new Bicycle("Schwinn", "turquoise");
const salsaFargo = new Bicycle("Salsa Fargo", "burnt orange");
const flying Merkel = new Bicycle("Flying Merkel", "green");
