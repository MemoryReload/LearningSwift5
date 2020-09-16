//: Playground - noun: a place where people can play

import Foundation

//Declaration
var str1: String
/*
var str12; //This will raise an error, cause doesn't declare the type
 */

//Initialization
str1="Hello Swift!"
//Declaration and initialization
var str2: String="Hello Swift!"
var str3="Hello Swift!"
/*
str1=4 //This will raise an error, cause the type of  variable "str" is String, and it's unchangeable.
str1=nil //This will raise an error, cause the type String is not compatible with nil.
 */

//Optional type
var str4: String?
str4="Hello Swift!"
var str5:String
/*
str5=str4 //This will raise an error,cause optional type should be unwrapped first before manipulation.
 */

//Unwrap
if let tmpStr=str4 {
    str5=tmpStr
}

//Force to unwrap
str5=str4!

/*
str4=nil
str5=str4!//This will raise an error, cause force unwrapping gets a nil value.
 */

let π: Double
π = 3.1415926
let num=4
/*
num=5 //This will raise an error,cause let keyword means that the value of num can not be changed.
 */


//Tupe
var tupe1:(name:String,age:Int)
tupe1=("John",20)
tupe1=(name:"Marlin",age:11)
var name=tupe1.name
var (_,age)=tupe1
print(name,age,separator:"\t",terminator:"\n")

var tupe2:(String,Int)
tupe2=("John",20);
name=tupe2.0
age=tupe2.1
print(name,age,separator:"\t",terminator:"\n")


//Collections Type

//Array
var array:Array<Any>
array=[1,2,3,"Hello Swift!"];

//Dictionary
var dic:Dictionary<String,Any>
dic=["integer":4,"string":"Hello Swift!","double":Double(0.4)]

//Set
var set:Set<Int>
set=[1,2,3,5];









