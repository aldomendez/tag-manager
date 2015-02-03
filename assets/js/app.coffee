window.r = new Ractive {
  el: 'container'
  template:'#template'
  data:
    editing: false
    marked:marked
}

socket = io.connect 'http://2vpsh02:1337'

reFetch = ->
  socket.request '/incidentes/', (incident)->
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