# Hello Electron
This project creates a Windows app from React app.  
Relative project [hello_rtd_excel](https://bitbucket.tradex.vn/users/tungdt/repos/hello_rtd_excel/browse)


### Steps
* Initialize a React app: `npx create-react-app hello_electron`
* Install ElectronJS as devDependencies:
    ````
    npm install --save-dev electron
    npm install --save-dev electron-builder
    ````
* Add Electron main window `public/electron.js`:
    ````
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
    ````
* Add Electron build config in `package.json`: 
    ````
    "main": "public/electron.js",
    "homepage": "./",
    "build": {
    "appId": "app.tung.ele",
    "files": [
      "build/**/*",
      "node_modules/**/*"
    ],
    "directories": {
      "buildResources": "assets"
    },
    "extraFiles": [
      {
        "from": "RTDExcel",
        "to": "."
      }
    ],
    "asar": true,
    "win": {
      "target": "nsis",
      "icon": "build/gopher.png"
    },
    "nsis": {
      "oneClick": false,
      "perMachine": true,
      "allowToChangeInstallationDirectory": true,
      "include": "build/installer.nsh",
      "artifactName": "daominah_electron_demo_Setup${version}.${ext}"
    }
    ````

* Create Windows installer for the app:
    ````
    react-scripts build
    electron-builder -c.extraMetadata.main=build/electron.js
    ````
    Output is file `dist/daominah_electron_demo_setup0.1.0.exe`.


### [Customize the installer](https://www.electron.build/configuration/nsis#custom-nsis-script)
Example for registering Windows DLLs while installing the app:
`public/installer.nsh`.


### References
[React basic]( https://reactjs.org/docs/state-and-lifecycle.html#using-state-correctly)  
[Pack React Electron app](https://medium.com/@kitze/%EF%B8%8F-from-react-to-an-electron-app-ready-for-production-a0468ecb1da3)  
[Require Electron from React component](https://stackoverflow.com/a/58384450/4097963)  
[Customize `electron-builder` installer](https://www.electron.build/configuration/nsis#custom-nsis-script)
