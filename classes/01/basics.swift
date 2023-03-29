import UIKit

var lista = ["mario", "santos", "sousa"]
var newList: [String] = []
for nome in lista {
    newList.insert(nome, at: 0)
}

print(newList)

/*
for value in stride(from: 5, to: 0, by:-1){
    print(value)
}
*/



func printList(list:[String]) -> Void {
    var bigest = 0

    list.forEach { value in
        if value.count > bigest {
            bigest = value.count
        }
    }
    
    let header = "".padding(toLength: bigest+4, withPad: "*", startingAt: 0)
    
    print(header)
    
    for v in list {
        let line = "* " + v
        if v.count < bigest {
            print(line.padding(toLength: bigest+2, withPad: " ", startingAt: 0), "*")
        } else {
            print("*",v,"*")
        }

    }
    
    print(header)
}

var values = ["mario", "ana", "really long stringssss", "test"]

printList(list: values)

func byCount (s1:String, s2: String) -> Bool {
    return s1.count < s2.count
}

var max = values.max(by: byCount)
print(max)

max = values.max(by: { (s1: String, s2: String) -> Bool in
    return s1.count < s2.count
})

print(max)
