international-phone-number
==========================

AngularJS directive implementing [intl-tel-input](https://github.com/Bluefieldscom/intl-tel-input) jQuery plugin.

Installation
--
Install via Bower:
`bower install international-phone-number --save`

Add module dependency to application:
`internationalPhoneNumber`

intl-tel-input is installed as a dependency. Make sure `intTelInput.js` is loaded first and add `flags.png` and `intlTelInput.css` to your project.

You can optionally include `bower_components/intl-tel-input/lib/libphonenumber/build/utils.js`.

DEMOS
--
[Plunkr](http://plnkr.co/edit/DYyfGj?p=preview)

[int-tel-input jQuery plugin demo](http://jackocnr.com/intl-tel-input.html)


Default options
--
Same as in source project (https://github.com/Bluefieldscom/intl-tel-input)

Sneak preview:
```coffeescript
    allowExtensions:        false
    autoFormat:             true
    autoHideDialCode:       true
    autoPlaceholder:        true
    customPlaceholder:      null
    defaultCountry:         ""
    geoIpLookup:            null
    nationalMode:           true
    numberType:             "MOBILE"
    onlyCountries:          undefined
    preferredCountries:     ['us', 'gb']
    skipUtilScriptDownload: false
    utilsScript:            ""
```

Global configuration (in angulars config phase)
---
There is a constant `ipnConfig` available in which all of the defaults are configured.
To change the defaults simply use the `ipnConfig` object:
```coffeescript
angular.module('app')
    .config (ipnConfig) ->
        ipnConfig.defaultCountry = 'pl'
        ipnConfig.preferredCountries = ['pl', 'de', 'fr', 'uk', 'es']

```

Usage
---
Works for `text` and `tel` input types.
NgModel is required

```html
<input type="text" international-phone-number ng-model="phone">
```

with bound country. Useful when you have external contries control:
```html
<input type="text" international-phone-number only-countries ng-model="phone" country="country">
```

with preferred countries:
```html
<input type="text" international-phone-number preferred-countries="pl, de" ng-model="phone">
```

with default country:
```html
<input type="text" international-phone-number default-country="pl" ng-model="phone">
```

with countries only:
```html
<input type="text" international-phone-number only-countries ng-model="phone">
```

Feel free to mix options together:
```html
<input type="text" international-phone-number only-countries="pl, de, en, es" default-country="pl" preferred-countries="pl, de" ng-model="phone">
```

Options
---
By default the directive lazy loads utils.js. If you want to load this yourself, use the `skip-util-script-download` attribute or set the ipnConfig.skipUtilScriptDownload to true.


License
---
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
