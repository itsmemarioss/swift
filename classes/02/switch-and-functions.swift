import Foundation

let dayOfWeek = 10;

switch dayOfWeek {
case 1:
    print("Sunday")
case 2:
    print("Monday")
default:
    //print("wrong day")
    break
}


// functions

func greet(person: String){
    print("Hello \(person)")
}

//greet(person: "mario")

func fibonacci(index: Int) -> Int{
    if(index <= 2){
        return 1;
    }
    
    var prev1 = 1;
    var prev2 = 1;
    var result = 0;
    
    for _ in 3...index {
        result = prev1 + prev2;
        prev1 = prev2;
        prev2 = result;
    }
    
    return result;
}

print(fibonacci(index: 6))
