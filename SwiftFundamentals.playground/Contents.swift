//: Playground - noun: a place where people can play
/*:
 **Note:** If you're seeing this text as comments rather than nicely-rendered text, select Editor\Show Rendered Markup in the Xcode menu.
 */

import UIKit

//: Constant
let greeting: String = "Hello"
let meaningOfLifeInUniverse: Int = 42

//: Variable
var city: String = "New York"

//: Tuples: Tuples are a very lightweight data structure that combine a set of values together.
let restaurantInfo = (name: "Open Oven", address: "Westwood", city: "Los Angeles", zipCode: 90024)

print("\(restaurantInfo.name) restaurant is located at \(restaurantInfo.address), \(restaurantInfo.zipCode)")

//: Tuples (accessing via index)
print("\(restaurantInfo.0) restaurant is located at \(restaurantInfo.1), \(restaurantInfo.2)")


//: For Loop & if-else construct
print("------ For Loop & if-else construct ------")

let totalBill = 100.0       // Type inference
var tipPercentage = 0.0

for rating in 1...5 {
    if rating == 5 {
        tipPercentage = 0.20
    } else if rating >= 3 {
        tipPercentage = 0.15
    } else {
        tipPercentage = 0.10
    }
    print("With a \(rating) star rating, you should leave a total of $\(totalBill + (tipPercentage * totalBill))")
}

//: Function
print("------ FUNCTION ------")
func calculateTipOnTotal(totalBill: Double, withRating rating:Int) -> Double {
    let tipPercentage:Double
    
    switch rating {
    case 5, 4:
        tipPercentage = 0.20
    case 3, 2:
        tipPercentage = 0.15
    default:
        tipPercentage = 0.10
    }
    
    return totalBill * tipPercentage
}

for rating in 1...5 {
    let tip = calculateTipOnTotal(totalBill, withRating: rating)
    print("With a \(rating) star rating, you should leave a total of $\(totalBill + tip)")
}

//: Optionals
print("------ OPTIONALS ------")

var restaurantName: String? = "Open oven"

// Force unwrapping
if restaurantName != nil {
    print("You went out to eat at \(restaurantName!)")
}

// Optional binding
if let restaurantName = restaurantName {
    print("You went out to eat at \(restaurantName)")
}

//: Guard
print("------ GUARD ------")

func tipPercentageForRating(rating: Double) -> Double? {
    guard rating >= 1 && rating <= 5 else {
        return nil
    }
    
    let tipPercentage: Double?
    switch rating {
    case 5, 4:
        tipPercentage = 0.20
    case 3, 2:
        tipPercentage = 0.20
    default:
        tipPercentage = 0.10
    }
    
    return tipPercentage
}

print("Tip percentage for a 10 star restaurant: \(tipPercentageForRating(10))")
print("Tip percentage for a 5 star restaurant: \(tipPercentageForRating(5))")

//: Struct
print("------ STRUCT ------")

struct RestaurantBill {
    let restaurantName: String
    var totalBill: Double
    var rating: Double
    
    func tipPercentage() -> Double? {
        guard rating >= 1 && rating <= 5 else {
            return nil
        }
        
        let tipPercentage: Double?
        if (rating == 5) {
            tipPercentage = 0.20
        } else if (rating >= 3){
            tipPercentage = 0.20
        } else {
            tipPercentage = 0.10
        }
        return tipPercentage;
    }
    
    func calcualteTip() -> Double {
        guard let tipPercentage = tipPercentage() else {
            return 0
        }
        
        return totalBill * tipPercentage;
    }
}

let restaurantBill = RestaurantBill(restaurantName: "Open Oven", totalBill: 100.0, rating: 5)
restaurantBill.calcualteTip()
print("You paid $\(restaurantBill.calcualteTip()) tip on your visit to \(restaurantBill.restaurantName) restaurant")





