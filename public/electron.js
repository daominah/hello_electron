const {app, BrowserWindow} = require('electron');
const path = require('path');

function createWindow() {
    // Create the browser window.
    let win = new BrowserWindow({
        width: 1280, height: 720,
        webPreferences: {
            nodeIntegration: true
        },
    });
    win.webContents.openDevTools();

    // and load the index.html of the app.
    // win.loadFile('index.html');
    // win.loadURL('http://localhost:3000/');
    win.loadURL(`file://${path.join(__dirname, '../build/index.html')}`)
}

app.on('ready', createWindow);
