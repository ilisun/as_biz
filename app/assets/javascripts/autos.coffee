# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:update", ->

  $("input[data-radio='radio-org']").click (e) ->
    type = $(this).data('type')
    $('.all-content').find('input:text').val('')
    $(".all-content").hide()
    $("#fieldset-"+type+"-content").show()

  # подставляем модели авто
  $('#client_country_id').change (e) ->
    e.preventDefault()
    country_id = $('#client_country_id :selected').val()
    city_path = "/clients/get_cities?country_id=#{country_id}"
    if country_id
      $.ajax city_path,
        type: 'GET'
        dataType: 'script'