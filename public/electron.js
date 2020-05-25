const electron = require('electron');
const path = require('path');

function createWindow() {
    // Create the browser window.
    let win = new electron.BrowserWindow({
        width: 1280, height: 720,
        webPreferences: {
            nodeIntegration: true
        },
    });

    // for debugging, openDevTools is equivalent to F12 in browser
    win.webContents.openDevTools();

    // win.loadFile('index.html');
    // win.loadURL('http://localhost:3000/');
    win.loadURL(`file://${path.join(__dirname, '../build/index.html')}`)
}

electron.app.on('ready', createWindow);
