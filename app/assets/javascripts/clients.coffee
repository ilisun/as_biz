# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#$(document).ready ->
#  $('#datatable-editable').dataTable()
#      'scrollY': '100px'
#      'scrollCollapse': true
#      'paging': false
#  return

$(document).on "page:update", ->
  cities = $('#client_city_id').html()
  $('#client_country_id').change (e) ->
    e.preventDefault()
    country = $('#client_country_id :selected').text()
    options = $(cities).filter("optgroup[label='#{country}']").html()
    if options
      $('#client_city_id').html(options)
      $('#client_city_id').parent().show()
    else
      $('#client_city_id').empty()
      $('#client_city_id').parent().hide()

  $("input[data-radio='radio-org']").click (e) ->
    type = $(this).data('type')
    $('.all-content').find('input:text').val('')
    $(".all-content").hide()
    $("#fieldset-"+type+"-content").show()




