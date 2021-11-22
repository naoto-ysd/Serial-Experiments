hello()

function hello(){
  console.log('hello')
}

const calc = function(num1,num2){
  return num1*num2
}

const num1 = 3
const num2 = 4
console.log(calc(num1,num2))

// (function counter(num) {
//   console.log(num)
// })(1)


const countNum = (num) => {
  console.log(num)
}
countNum(1)

let human = {
  name: "Jhon",
  gender: "man",
  age: 24,
}

console.log(human.name)


let human2 = { name: 'yamada' }
console.log(human2)

human2.age = 25
human2['address'] = 'Tokyo'

console.log(human2)