$(document).ready ->
  
  $('.calendar_header').on 'click', '#prev_month', (e) ->
    e.preventDefault()
    $.ajax '/periods',
      data: 
        'period': 'prevMonth'
      success: (data) ->
        console.log "foo"


  $('.calendar_header').on 'click', '#next_month', (e) ->
    e.preventDefault()
    
  