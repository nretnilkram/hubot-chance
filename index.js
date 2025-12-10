const fs = require('fs');
const path = require('path');

module.exports = (robot, scripts) => {
  const scriptsPath = path.resolve(__dirname, 'src');
  fs.exists(scriptsPath, (exists) => {
    if (exists) {
      const scriptFiles = fs.readdirSync(scriptsPath);
      for (const script of scriptFiles) {
        if (scripts && !scripts.includes('*')) {
          if (scripts.includes(script)) {
            robot.loadFile(scriptsPath, script);
          }
        } else {
          robot.loadFile(scriptsPath, script);
        }
      }
    }
  });
};