international-phone-number
==========================

AngularJS directive implementing intl-tel-input (https://github.com/Bluefieldscom/intl-tel-input) 

Installation
--
install via bower:
`bower install international-phone-number --save`
add module dependcy to application:
`internationalPhoneNumber`

DEMO
--
Available from souce project at https://github.com/Bluefieldscom/intl-tel-input#demo-and-examples


Default options
--
Same as in source project (https://github.com/Bluefieldscom/intl-tel-input)

Sneak preview:
```coffeescript
    options =
      autoFormat:         true
      autoHideDialCode:   true
      defaultCountry:     ''
      nationalMode:       false
      numberType:         ''
      onlyCountries:      undefined
      preferredCountries: ['us', 'gb']
      responsiveDropdown: false
      utilsScript:        ""
```

Usage
---
Works for `text` and `tel` input types.
NgModel is required

```html
<input type="text" international-phone-number ng-model="phone">
```

with preferred countries:
```html
<input type="text" international-phone-number preferred-countries="pl, de" ng-model="phone">
```

with default country:
```html
<input type="text" international-phone-number default-country="pl" ng-model="phone">
```

with only contries:
```html
<input type="text" international-phone-number only-countries ng-model="phone">
```

Feel free to mix options together:
```html
<input type="text" international-phone-number only-countries="pl, de, en, es" default-country="pl" preferred-countries="pl, de" ng-model="phone">
```


