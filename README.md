# An example of embedding a React component inside Pux

This example project uses `purescript-pux` and `react-quill` to demonstrate
how, with some modifications, Pux could handle non-standard events from
React components. "Non-standard" in this case means cases where the
callback/handler function does not receive a JavaScript `Event` object, but
some other type of argument or even multiple arguments.

The non-standard event handling machinery courtesy of @chexxor.

Of note are `changeHandler` function in src/Editor.js, `evt` and `update`
functions in src/Main.purs.


## To run this example

```sh
$ git clone git@github.com:karls/pux-react-component-test.git
$ cd pux-react-component-test
$ npm install
$ npm run watch
```

Open http://localhost:3000, which should display the editor with some initial data.