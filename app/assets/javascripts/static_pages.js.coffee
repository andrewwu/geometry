# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  select_manufacturers_prompt = -> $('#manufacturer_id').val('')

  select_models_prompt = -> $('#model_id').val('')

  select_sizes_prompt = -> $('#size_id').val('')

  disable_manufacturers = (disabled) ->
    $('#manufacturer_id').prop('disabled', disabled)

  disable_models = (disabled) ->
    $('#model_id').prop('disabled', disabled)

  disable_sizes = (disabled) ->
    $('#size_id').prop('disabled', disabled)

  reload_manufacturers = ->
    $('#manufacturer_id').html(manufacturers)
    select_manufacturers_prompt()

  reload_models = ->
    $('#model_id').html(models)
    select_models_prompt()

  reload_sizes = ->
    $('#size_id').html(sizes)
    select_sizes_prompt()

  reset_models = ->
    reload_models()
    select_models_prompt()
    disable_models(true)

  reset_sizes = ->
    reload_sizes()
    select_sizes_prompt()
    disable_sizes(true)

  manufacturers = $('#manufacturer_id option')
  models = $('#model_id').html()
  sizes = $('#size_id').html()

  disable_manufacturers(true)
  disable_models(true)
  disable_sizes(true)

  $('input[type="submit"]').click ->
    model_id = $('#model_id').val()
    size_id = $('#size_id').val()
    if $("tr[data-model-id='#{model_id}'][data-size-id='#{size_id}']").length
      # already added, show error
      return false
    else
      $('.getting-started').hide()

  $('#year').change ->
    year = $('#year :selected').text()

    reload_manufacturers()
    select_manufacturers_prompt()

    reset_models()
    reset_sizes()

    if year == 'Year'
      disable_manufacturers(true)
      return

    year = parseInt(year)

    options = $(manufacturers).filter ->
      years = $(this).data('years')
      return false if typeof years == 'undefined'
      return years.indexOf(year) > -1

    options = $(options).toArray()
    prompt = new Option('Manufacturer', '')
    options.unshift(prompt)

    $('#manufacturer_id').html(options)

    select_manufacturers_prompt()
    disable_manufacturers(options.length == 1)

  $('#manufacturer_id').change ->
    year = parseInt($('#year :selected').text())
    manufacturer = $('#manufacturer_id :selected').text()

    if manufacturer == 'Manufacturer'
      reset_models()
      reset_sizes()
      return

    options = $(models).filter("optgroup[label='#{manufacturer}']")
    options = $(options).children()
    options = $(options).filter ->
      return $(this).data('year') == year

    options = $(options).toArray()
    prompt = new Option('Model', '')
    options.unshift(prompt)

    $('#model_id').html(options)

    select_models_prompt()
    disable_models(options.length == 1)

  $('#model_id').change ->
    year = parseInt($('#year :selected').text())
    manufacturer = $('#manufacturer_id :selected').text()
    model = $('#model_id :selected').text()

    if model == 'Model'
      reset_sizes()
      return

    options = $(sizes).filter("optgroup[label='#{year} #{manufacturer} #{model}']").html()

    options = $(options).toArray()
    prompt = new Option('Size', '')
    options.unshift(prompt)

    $('#size_id').html(options)

    select_sizes_prompt()
    disable_sizes(options.length == 1)
