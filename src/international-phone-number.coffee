# Author Marek Pietrucha
# https://github.com/mareczek/international-phone-number

"use strict"
angular.module("internationalPhoneNumber", []).directive 'internationalPhoneNumber', () ->

  restrict:   'A'
  require: '^ngModel'
  scope: true

  link: (scope, element, attrs, ctrl) ->

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
      option = eval("attrs.#{key}")
      if angular.isDefined(option)
        if key == 'preferredCountries'
          options.preferredCountries = handleWhatsSupposedToBeAnArray option
        else if key == 'onlyCountries'
            options.onlyCountries = handleWhatsSupposedToBeAnArray option
        else if typeof(value) == "boolean"
          options[key] = (option == "true")
        else
          options[key] = option

    element.intlTelInput(options)

    unless options.utilsScript
      element.intlTelInput('loadUtils', 'bower_components/intl-tel-input/lib/libphonenumber/build/utils.js')

    ctrl.$parsers.push (value) ->
      return value if !value
      value.replace(/[^\d]/g, '')

    ctrl.$parsers.push (value) ->
      if value
        validity = element.intlTelInput("isValidNumber")
        ctrl.$setValidity 'international-phone-number', validity
        ctrl.$setValidity '', validity
      else
        value = ''
        delete ctrl.$error['international-phone-number']
      value

    element.on 'blur keyup change', (event) ->
      scope.$apply read

    element.on '$destroy', () ->
      element.off 'blur keyup change'
