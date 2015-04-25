international-phone-number
==========================

AngularJS directive implementing intl-tel-input (https://github.com/Bluefieldscom/intl-tel-input) jQuery plugin.

Installation
--
Install via Bower:
`bower install international-phone-number --save`

Add module dependcy to application:
`internationalPhoneNumber`

intl-tel-input is installed as a dependency. Make sure `intTelInput.js` is loaded first and add `flags.png` and `intlTelInput.css` to your project.

You can optionally include `bower_components/intl-tel-input/lib/libphonenumber/build/utils.js`.

DEMO
--
Available from souce project at http://jackocnr.com/intl-tel-input.html


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

with only countries:
```html
<input type="text" international-phone-number only-countries ng-model="phone">
```

Feel free to mix options together:
```html
<input type="text" international-phone-number only-countries="pl, de, en, es" default-country="pl" preferred-countries="pl, de" ng-model="phone">
```

Options
---
By default the directive lazy loads utils.js. If you want to load this yourself, use the `skip-util-script-download` attribute.
