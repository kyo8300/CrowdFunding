$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote

      minHeight: null,
      maxHeight: null,
      focus: true