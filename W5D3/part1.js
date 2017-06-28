"Use strict"

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString){
  return searchString.includes(subString);
}

console.log(isSubstring("time to program", "time"));

function fizzBuzz(array){
  const newarray = [];

  array.forEach(el => {
    if ((el%3 === 0) ^ (el % 5 ===0)){
      newarray.push(el);
    }
  });
  return newarray;
}

function isPrime(number){
  if (n<2) {return false;}

  for(let i=2; i<number; i++){
    if number%i == 0{
      return false;
    }
  };
  return true;
}

function sumOfNPrimes(n){
  var sum = 0;

  for(let i=0, i<number, i++){
    if isPrime(i){
      sum+= i
    }
  };
  return sum;
}
