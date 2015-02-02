window.r = new Ractive {
  el: 'container'
  template:'#template'
  data: {}
}

socket = io.connect 'http://2vpsh02:1337'

reFetch = ->
  socket.request '/incidente/', (incident)->
    r.set 'incident', incident
    console.log incident

socket.on 'connect', ()->
  reFetch()

  socket.on 'incidente', (message)->
    console.log 'Got message:', message

    if message.verb is 'created'
      location.hash = "incidente/#{message.data.id}"
      r.data.incident.unshift message.data
    if message.verb is 'destroyed'
      r.set 'destroyed', message
      reFetch()