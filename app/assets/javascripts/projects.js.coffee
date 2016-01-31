# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $( "#load-tasks" ).click(loadTasks);

loadTasks = ->
  taskElements = undefined
  taskTable = $('#task_tb')
  projectId = taskTable.data('params-id');

  $.get projectId, ((data) ->
    for task in data.tasks
      taskElements += "<tr><td>#{task.name}</td><td>#{task.description}</td><td>#{task.status}</td></tr>"

    taskTable.html taskElements

  ), 'json'
  return

  taskTable.html taskElements
  return
