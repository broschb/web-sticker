$ ->
  $('.delete-scribblet').click ->
    id = $(this).data('id');
    result = confirm("Are you sure you want to delete this Scribblet?")
    if result
      $.ajax
        url: "/scribblets/#{id}"
        type: "DELETE"
        success: (result) =>
          $(this).closest('.row').remove()
          return
