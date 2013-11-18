jQuery ->
  $('.best_in_place').best_in_place()

  $('form#track_a_box').submit ->
    return false if $('#track_a_box #uid').val().length < 1