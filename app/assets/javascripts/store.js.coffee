setStore = ->
  $('.navbar-select').on 'change', ->
    store_id = $(this).val()
    $.ajax
      type: 'GET'
      url:  '/'
      data: { selected_store: { store_id: store_id} }
      document.cookie = "selected_store_id=" + escape(store_id)

getCookie = (name) ->
  value = '; ' + document.cookie
  parts = value.split('; ' + name + '=')
  if parts.length == 2
    parts.pop().split(';').shift()

setCookie = (cname, cvalue, exMins) ->
  d = new Date
  d.setTime d.getTime() + exMins * 60 * 1000
  expires = 'expires=' + d.toUTCString()
  document.cookie = cname + '=' + cvalue + ';' + expires + ';path=/'


getUserLocation = ->
  return if getCookie('selected_store_id')
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition (position) ->
      $.ajax
        type: 'GET'
        url:  '/'
        data: { position: position.coords }

findStore = ->
  $('.find-store').on 'click', ->
    if navigator.geolocation
      setCookie 'selected_store_id', '', 0
      getUserLocation()

$(document).on 'ready', ->
  getUserLocation()
  setStore()
  findStore()
