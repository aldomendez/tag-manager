/**
* Incidente.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  attributes: {
    area:{
      type:'string',
      enum:['osas','pruebas','shim','paquetes']
    },
    description:{
      type:'string',
      defaultsTo:''
    },
    clasification:{
      type:'string',
      defaultsTo:'unspecified'
    },
    shift:{
      type:'string',
      enum:[1,2,3,4,5]
    },
    correctiveActions:{
      type:'array'
    },
    status:{
      type:'string',
      enum:['impact','alert','process','resolved']
    },
    responsible:{
      type:'string',
      defaultsTo:'unspecified'
    }
  }
};

