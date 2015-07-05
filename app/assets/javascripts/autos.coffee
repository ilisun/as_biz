# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on "page:change", ->

    $("input[data-radio='radio-org']").click (e) ->
      type = $(this).data('type')
      $('.all-content').find('input:text').val('')
      $(".all-content").hide()
      $("#fieldset-"+type+"-content").show()

    # подставляем модели авто
    $('#auto_auto_car_attributes_mark').change (e) ->
      e.preventDefault()
      id_car_mark = $('#auto_auto_car_attributes_mark :selected').val()
      model_path = "/autos/get_models?id_car_mark=#{id_car_mark}"
      if id_car_mark
        $.ajax model_path,
          type: 'GET'
          dataType: 'script'
    # подставляем поколение авто
    $('#auto_auto_car_attributes_model').change (e) ->
      e.preventDefault()
      id_car_model = $('#auto_auto_car_attributes_model :selected').val()
      generation_path = "/autos/get_generations?id_car_model=#{id_car_model}"
      if id_car_model
        $.ajax generation_path,
          type: 'GET'
          dataType: 'script'
    # подставляем серию авто
    $('#auto_auto_car_attributes_generation').change (e) ->
      e.preventDefault()
      id_car_generation = $('#auto_auto_car_attributes_generation :selected').val()
      serie_path = "/autos/get_series?id_car_generation=#{id_car_generation}"
      if id_car_generation
        $.ajax serie_path,
          type: 'GET'
          dataType: 'script'
    # подставляем модификацию авто
    $('#auto_auto_car_attributes_serie').change (e) ->
      e.preventDefault()
      id_car_serie = $('#auto_auto_car_attributes_serie :selected').val()
      modification_path = "/autos/get_modifications?id_car_serie=#{id_car_serie}"
      if id_car_serie
        $.ajax modification_path,
          type: 'GET'
          dataType: 'script'

    $('#vinId').bind 'keyup', (e) ->
      len = $('#vinId').val().length
      if len > 17
        $('#vinId').val $('#vinId').val().slice(0,-(len - 17))
      if e.which >= 97 and e.which <= 122
        newKey = e.which - 32
        e.keyCode = newKey
        e.charCode = newKey
      $('#vinId').val $('#vinId').val().toUpperCase()



  $(document).on "page:update", ->

    $('#input_auto_select_client').bind 'keyup', (e) ->
      name = $('#input_auto_select_client').val()
      client_path = "/autos/get_clients?name=#{name}"
      if name
        $.ajax client_path,
          type: 'GET'
          dataType: 'script'

    $('#area_auto_select_client').change (e) ->
      $('#input_auto_select_client').val $('#area_auto_select_client :selected').text()

    $('#autos_modal_ok').click (e) ->
      $('#auto_client_name').val $('#area_auto_select_client :selected').text()
      $('#auto_client_id').val $('#area_auto_select_client :selected').val()
      $('#select_client').modal('hide');

