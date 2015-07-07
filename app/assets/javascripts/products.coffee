# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#datatable-product').dataTable
    processing: false
    serverSide: true
    ajax: $('#datatable-product').data('source')
    pagingType: 'full_numbers'
    oLanguage: {
#      "sProcessing": "<img src='loading.gif'>"
      "sInfo": "Показано c _START_ по _END_ из _TOTAL_ записей"
      "sSearch": ""
      "sLengthMenu": "\_MENU_"
      "sEmptyTable": "Данных нет"
      "oPaginate": {
        "sFirst": "В начало"
        "sPrevious": "<"
        "sNext": ">"
        "sLast": "В конец"
      }
    }