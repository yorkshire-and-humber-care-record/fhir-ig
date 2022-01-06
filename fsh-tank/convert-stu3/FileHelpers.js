var fs = require('fs');
var path = require('path')

exports.replaceStringInFile = function(inFilePath, outFilePath, findString, replaceString) {

  fs.readFile(inFilePath, 'utf8', function (err,data) {
    if (err) {
      return console.log(err);
    }
    var escapedFindString=findString.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
    var result = data.replace(new RegExp(escapedFindString, 'g'), replaceString);
    //console.log(result);

    ensureDirectoryExistence(outFilePath);
    fs.writeFile(outFilePath, result, 'utf8', function (err) {
      if (err) return console.log(err);
    });
 });
}


exports.getAllFiles = function(dirPath, arrayOfFiles) {
  result = buildFileArray (dirPath);
  //console.log(result);
  return result;
};


function ensureDirectoryExistence(filePath) {
  var dirname = path.dirname(filePath);
  if (fs.existsSync(dirname)) {
    return true;
  }
  ensureDirectoryExistence(dirname);
  fs.mkdirSync(dirname);
}


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

