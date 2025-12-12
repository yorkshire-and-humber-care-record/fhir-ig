var fs = require('fs');
var path = require('path')


exports.ensureDirectoryExistence = function (filePath) {
  var dirname = path.dirname(filePath);
  if (fs.existsSync(dirname)) {
    return true;
  }
  this.ensureDirectoryExistence(dirname);
  fs.mkdirSync(dirname);
}


exports.getAllFiles = function(dirPath, arrayOfFiles) {
  result = buildFileArray (dirPath);
  //console.log(result);
  return result;
};


function buildFileArray(dirPath, arrayOfFiles) {

  files = fs.readdirSync(dirPath);
  arrayOfFiles = arrayOfFiles || [];

  files.forEach(function(file) {
    if (fs.statSync(dirPath + "\\" + file).isDirectory()) {
      arrayOfFiles = buildFileArray(dirPath + "\\" + file, arrayOfFiles)
    } else {
      arrayOfFiles.push(path.join(dirPath, "\\", file))
    }
  });

  return arrayOfFiles
};

