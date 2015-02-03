/**
 * justLogSession
 *
 * @module      :: Policy
 * @description :: I just want to see the response of the `req.session` variable
                   So I can have a better undestanding of what is going on internally
 * @docs        :: http://sailsjs.org/#!documentation/policies
 *
 */
module.exports = function(req, res, next) {

  // User is allowed, proceed to the next policy, 
  // or if this is the last policy, the controller
  sails.log.error('Session',JSON.stringify(req.session))
  return next();

  // User is not allowed
  // (default res.forbidden() behavior can be overridden in `config/403.js`)
  return res.forbidden('You are not permitted to perform this action.');
};
