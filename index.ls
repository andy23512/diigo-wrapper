{app, BrowserWindow} = require \electron
require! <[path url]>

var win

function create-window
  {screen} = require('electron')
  size = screen.get-primary-display!work-area-size
  {width, height} = size
  win = new BrowserWindow {width, height}

  win.loadURL url.format do
    pathname: path.join __dirname, \index.html
    protocol: \file:
    slashes: true

  # win.web-contents.open-dev-tools!

  win.on \closed -> win = null

app.on \ready create-window
app.on \window-all-closed -> app.quit! if process.platform isnt \darwin
app.on \activate -> create-window! if win is null
