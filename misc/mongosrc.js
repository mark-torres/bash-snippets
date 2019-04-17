// Script reference: https://docs.mongodb.com/manual/tutorial/write-scripts-for-the-mongo-shell/
// open db
db = connect("localhost:27017/cache_db");

// collection to empty
collectionName = "cache_test";

// get collections
collections = db.getCollectionNames();
for(i = 0; i < collections.length ; i++) {
	if (collections[i] == collectionName) {
		print('Target collection found: ' + collections[i]);
		targetCol = db.getCollection(collections[i]);
		print('Deleting all documents in target collection ['+collectionName+']');
		try {
			if (!targetCol.isCapped()) {
				result = targetCol.deleteMany({});
				print("Documents deleted: " + result.deletedCount);
			} else {
				print("Target collection is capped, cannot delete documents.");
			}
		} catch (e) {
			print(e);
		}
	}
}

// exit shell
quit();
