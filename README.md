# **DEPhoneNumberFormatter**

## Example - DEPhoneNumberFormatter
```swift
// NANP countries
let phoneNumberFormatter = DEPhoneNumberFormatter()
print(phoneNumberFormatter.number(from: "1"))
print(phoneNumberFormatter.number(from: "12"))
print(phoneNumberFormatter.number(from: "123"))
print(phoneNumberFormatter.number(from: "1234"))
print(phoneNumberFormatter.number(from: "12345"))
print(phoneNumberFormatter.number(from: "123456"))
print(phoneNumberFormatter.number(from: "1234567"))
print(phoneNumberFormatter.number(from: "12345678"))
print(phoneNumberFormatter.number(from: "123456789"))
print(phoneNumberFormatter.number(from: "1234567890"))
```
##### Output
```
(1
(12
(123
(123) 4
(123) 45
(123) 456
(123) 456-7
(123) 456-78
(123) 456-789
(123) 456-7890
```

## Example - DEPhoneNumberTextField
```swift
let textField = DEPhoneNumberTextField()
textField.setup()
```
