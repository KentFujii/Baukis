$(document).on 'page:change', ->
  $("#tag-it").tagit(
    afterTagAdded: (e, ui) ->
      unless ui.duringInitialization
        message_id = $("#tag-it").data('message-id')
        path = "/messages/#{message_id}/tag"
        $.post(path, { label: ui.tagLabel })
    afterTagRemoved: (e, ui) ->
      unless ui.duringInitialization
        message_id = $("#tag-it").data('message-id')
        path = "#{message_id}/tag"
        $.ajax(type: 'DELETE', url: path, data: { label: ui.tagLabel })
  )