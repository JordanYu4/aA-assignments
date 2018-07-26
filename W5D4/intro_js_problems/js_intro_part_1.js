
function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ` +
  `${adjective.toUpperCase()} ${noun.toUpperCase()}`
}

// console.log(madLib('make', 'best', 'carnitas'));

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time")); // => true

// console.log(isSubstring("Jump for joy", "joys")); // => false

function isSubstringTedious(searchString, subString) {
  for (i = 0; i < searchString.length - subString.length; i++) {
    if (subString === searchString.slice(i, subString.length)) {
      return true;
    }
  }
  return false;
}

// console.log(isSubstringTedious("time to program", "time")); // => true

// console.log(isSubstringTedious("Jump for joy", "joys")); // => false

function fizzBuzz(array) {
  let arr = [];
  for (i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0) != (array[i] % 5 === 0)) {
      arr.push(array[i]);
    }
  }
  return arr;
}

// console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9])) // => [3, 5, 6, 9]

function isPrime(number) {
  if (number === 0 || number === 1) return false;
  for (i = 2; i < number; i++) {
    if (number % i === 0) return false;
  }
  return true;
}

// console.log(isPrime(8)) // => false
// console.log(isPrime(71)) // => true
// console.log(isPrime(2)) // => true
// console.log(isPrime(1)) // => false

function firstNPrimes(n) {
  let primes = [];
  let num = 2
  while (primes.length < n) {
    if (isPrime(num)) primes.push(num);
    ++num;
  }
  return primes;
}

console.log(firstNPrimes(7));

function sumOfNPrimes(n) {
  let primes = firstNPrimes(n);
  return primes.reduce((acc, num) => {
    return acc + num;
  });
}

console.log(sumOfNPrimes(7)); // => 58
