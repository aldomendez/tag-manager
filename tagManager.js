Tags = new Mongo.Collection("tags");
Codes = new Mongo.Collection("codes");
if (Meteor.isClient) {
  // This code only runs on the client
  Template.body.helpers({
    tags: function () {
      return Tags.find();
    },
    codes: function () {
      return Codes.find();
    }
  });
}