# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $( '#load-tasks' ).click(loadTasks)


loadTasks = ->
  taskElements = undefined
  taskTable = $('#task_tb')
  projectId = taskTable.data( 'project-id' )

  $.get projectId, ((data) ->
    for task in data.tasks
      taskElements += "<tr><td>#{task.name}</td><td>#{task.description}</td><td>#{task.status}</td><td><input class=\"deleteTask\" data-task-id=\"#{task.id}\" type=\"button\" value=\"Delete\"></td></tr>"

    taskTable.html taskElements

    # add event listener for click to delete task and remove from page
    deleteTasks = $( '.deleteTask' )
    deleteTasks.bind 'click', ->
      taskId = $(this).data( 'task-id' )
      $(this).closest( 'tr' ).fadeOut()
      $.ajax
        type: 'DELETE'
        url: '/tasks/'+taskId
        dataType: 'json'
        data: '_method': 'destroy'
        complete: ->
          return
      event.preventDefault()
  ), 'json'
  return

  taskTable.html taskElements
  return

