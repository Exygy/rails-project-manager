$(document).ready(function(){
  if(window.location.pathname.split("/")[1] === "projects"){
    var projectId = window.location.pathname.split("/")[2]
    
    if(!isNaN(parseInt(projectId))){
      getTasks(projectId)
    }
  }
  setDestroyListener()
})

var setDestroyListener = function(){
  $('ol').on('click', '.destroy', destroyTask)
}

var getTasks = function(projectId){
  var taskRequest = $.ajax({
    url: "http://localhost:3000/projects/" + String(projectId) + "/tasks.json",
    type:'get'
  })

  taskRequest.done(displayTasks)
}

var displayTasks = function(response){
  console.log("Success!")
  for(var i = 0; i < response.length; i++){
    $("#tasks").append(makeNode(response[i]))
  }
}

var makeNode = function(task){
  var node = "<li id='" + task.id + "'><strong>" + task.name + "</strong><br>Difficulty: " + task.difficulty_level + "<br>" + task.description + "<br><a class='destroy btn btn-danger' data-id='" + task.id + "' href='http://localhost:3000/projects/" + task.project_id + "/tasks/" + task.id + "' rel='nofollow'>Destroy</a></li>" 
  return node
}

var destroyTask = function(e){
  e.preventDefault()
  removeTaskFromServer(e.target.href)
  hideTask(e.target.parentElement.id)
}

var removeTaskFromServer = function(url){
  var destroyRequest = $.ajax({
    url: url,
    type: 'delete'
  })

  destroyRequest.done(function(){Console.log("Task destroyed")})
  // destroyRequest.fail(debug)
}

var hideTask = function(id){
  $('#' + id).remove()
}

var debug = function(response){
  console.log("Failure")
  debugger
}