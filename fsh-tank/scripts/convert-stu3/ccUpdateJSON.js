// One off script to update current code System JSON files to include mandatory
// elements (title/ experimental/caseSensitive ) within ShareableCodeSystem profile. 
// Start of one-off script
fileArraySTU3 = fileHelpers.getAllFiles(dirSTU3);
fileArraySTU3.forEach(function(filePathSTU3) {
var fileData = fs.readFileSync(filePathSTU3,'utf8');

var process = false;     

if(filePathSTU3.includes("CodeSystem")) process = true;
if(filePathSTU3.includes("ValueSet")) process = true;

if(process) {
  var jsonObject = JSON.parse(fileData);
  if(jsonObject.resourceType=="CodeSystem" || jsonObject.resourceType == "ValueSet") 
  {
    jsonObject = updateCodeSystemFiles(jsonObject);
  }
  fileData = JSON.stringify(jsonObject, null, 2);
          
}
fs.writeFileSync(filePathSTU3, fileData, 'utf8')
});

// updating original Care connect JSON files as they are being overwritten during the publising process.

fileArrayCCSTU3 = fileHelpers.getAllFiles(dirCCSTU3);
fileArrayCCSTU3.forEach(function(filePathCCSTU3) {
var fileData = fs.readFileSync(filePathCCSTU3,'utf8');

var process = false;     

if(filePathCCSTU3.includes("CodeSystem")) process = true;
if(filePathCCSTU3.includes("ValueSet")) process = true;

if(process) {
  var jsonObject = JSON.parse(fileData);
  if(jsonObject.resourceType=="CodeSystem" || jsonObject.resourceType == "ValueSet")
  {
    jsonObject = updateCodeSystemFiles(jsonObject);
  }
  fileData = JSON.stringify(jsonObject, null, 2);
          
}
fs.writeFileSync(filePathCCSTU3, fileData, 'utf8')
});

function updateCodeSystemFiles(jsonObject){
  if(!("title" in jsonObject)){
    jsonObject.title = jsonObject.name;    
  }

  if(!("experimental" in jsonObject)){
    jsonObject.experimental = false;    
  }

  if(jsonObject.resourceType=="CodeSystem"){
    if(!("caseSensitive" in jsonObject)){
      jsonObject.caseSensitive = true;
    } 
  }

  return jsonObject;
} 

// end of one-off script
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////