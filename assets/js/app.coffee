window.r = new Ractive {
  el: 'container'
  template:'#template'
  data:
    editing: false
    marked:marked
}


socket = io.connect 'http://2vpsh02:1337'

reFetch = ->
  socket.request '/incidentes', (incident)->
    r.set 'incident', incident
    console.log incident

socket.on 'connect', ()->
  reFetch()

  socket.on 'incidentes', (message)->
    console.log 'Got message:', message

    if message.verb is 'created'
      location.hash = "incidentes/#{message.data.id}"
      r.data.incident.unshift message.data
    if message.verb is 'destroyed'
      r.set 'destroyed', message
      reFetch()

  r.on 'reportIncident', (e)->
    e.original.preventDefault()
    # console.log r.data.newComment
    socket.post "/incidentes", r.data.newComment, (res)->
      console.log res

  r.on 'destoyItem', (e)->
    e.original.preventDefault()
    console.log  socket
    socket.request "/incidentes/destroy/#{e.context.id}", (destroyed)->
      console.log destroyed

  r.on 'createNewFromTemplate', (e)->
    e.original.preventDefault()
    socket.request "/incidentes/create/?area=osas&description=problemas+Con+curado+canal+4&shift=4&responsible=Aldo+Mendez", (res)->
      console.log res

  r.on 'dismissDestroyed', (e)->
    e.original.preventDefault()
    r.set("destroyed", null)