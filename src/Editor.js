"use strict";

const React = require('react');
const Pux = require('purescript-pux');
const ReactQuill = require('react-quill');

exports.fromReact = Pux.fromReact(ReactQuill);

exports.changeHandler = function (key, action) {
  return [key, function (input, parentAction) {
    return function () {
      if (arguments) {
        var ev = arguments[0];
      }
      if ((key === 'onSubmit')
        || (key === 'onClick' && ev.currentTarget && ev.currentTarget.nodeName.toLowerCase() === 'a')) {
        ev.preventDefault();
      }
      input(parentAction(action(arguments)))();
    };
  }];
};
