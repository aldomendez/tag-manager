var socket = io.connect('http://2vpsh02:1337/');

socket.on('connect', function(){
  socket.request('/incidente/', function (users) {
    console.log(users);
  });

  socket.on('incidente', function messageHandler (message) {
    //console.log('Got message:', message);
    if (message.verb === 'created') {
      location.href = location.href + 'incidente/' + message.data.id;
    };
  })
});