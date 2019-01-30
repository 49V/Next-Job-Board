# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@openPostJobPop = () ->
  element = document.getElementById "post-job-pop"
  element.style.display = "inherit"


@closePostJobPop= () -> 
  element = document.getElementById "post-job-pop"
  element.style.display = "none"
