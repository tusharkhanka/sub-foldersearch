
var query = {
 "language": "db-cmis",
 "query": "SELECT cmis:name FROM cmis:folder WHERE cmis:name LIKE \'%" + args.query + "%'"
}
var folders = search.query(query);

var results = [];
for each (folder in folders)
{
 if (folder.displayPath.indexOf("surf-config") == -1)
 {
  results.push({
   "displayPath": folder.displayPath + "/" + folder.name,
   "nodeRef": folder.nodeRef.toString(),
   "qnamePath": folder.qnamePath
 });
 }
}


model.results = results;