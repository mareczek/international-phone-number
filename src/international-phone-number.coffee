# Author Marek Pietrucha
# https://github.com/mareczek/international-phone-number

"use strict"
angular.module("internationalPhoneNumber", []).directive 'internationalPhoneNumber', ['$timeout', ($timeout) ->

  restrict:   'A'
  require: '^ngModel'
  scope: {
    ngModel: '='
    defaultCountry: '@'
  }

  link: (scope, element, attrs, ctrl) ->

    if ctrl
      if element.val() != ''
        $timeout () ->
          element.intlTelInput 'setNumber', element.val()
          ctrl.$setViewValue element.val()
        , 0


    read = () ->
      ctrl.$setViewValue element.val()

    handleWhatsSupposedToBeAnArray = (value) ->
      if value instanceof Array
        value
      else
        value.toString().replace(/[ ]/g, '').split(',')

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

    angular.forEach options, (value, key) ->
      return unless attrs.hasOwnProperty(key) and angular.isDefined(attrs[key])
      option = attrs[key]
      if key == 'preferredCountries'
        options.preferredCountries = handleWhatsSupposedToBeAnArray option
      else if key == 'onlyCountries'
        options.onlyCountries = handleWhatsSupposedToBeAnArray option
      else if typeof(value) == "boolean"
        options[key] = (option == "true")
      else
        options[key] = option

    # Wait for ngModel to be set
    watchOnce = scope.$watch('ngModel', (newValue) ->
      # Wait to see if other scope variables were set at the same time
      scope.$$postDigest ->
        options.defaultCountry = scope.defaultCountry

        if newValue != null and newValue != undefined and newValue != ''
          element.val newValue

        element.intlTelInput(options)

        unless attrs.skipUtilScriptDownload != undefined || options.utilsScript
          element.intlTelInput('loadUtils', '/bower_components/intl-tel-input/lib/libphonenumber/build/utils.js')

        watchOnce()

    )


    ctrl.$formatters.push (value) ->
      if !value
        return value
      else
        $timeout () ->
          element.intlTelInput 'setNumber', value
        , 0
        return element.val()

    ctrl.$parsers.push (value) ->
      return value if !value
      value.replace(/[^\d]/g, '')

    ctrl.$validators.internationalPhoneNumber = (value) ->
      if element.attr('required')
        if !value
          return false
        else
          return element.intlTelInput("isValidNumber")
      else
        if element.intlTelInput("getSelectedCountryData").dialCode == value
          return true
        else
          if !value
            return true
          else 
            return element.intlTelInput("isValidNumber")


    element.on 'blur keyup change', (event) ->
      scope.$apply read

    element.on '$destroy', () ->
      element.intlTelInput('destroy');
      element.off 'blur keyup change'
]
