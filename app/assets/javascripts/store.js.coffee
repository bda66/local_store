setStore = ->
  $('.navbar-select').on 'change', ->
    store_id = $(this).val()
    console.log(store_id)
    $.ajax
      type: 'GET'
      url:  '/'
      data: { selected_store: { store_id: store_id} }

$(document).on 'ready', ->
  setStore()
