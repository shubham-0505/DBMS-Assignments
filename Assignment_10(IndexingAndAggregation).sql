ubuntu@ubuntu-virtual-machine:~$ mongosh
Current Mongosh Log ID:	63714a189f2e6e891bd16a8e
Connecting to:		mongodb://127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.6.0
Using MongoDB:		5.0.13
Using Mongosh:		1.6.0

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2022-11-14T00:49:21.455+05:30: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
   2022-11-14T00:49:33.256+05:30: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
------

------
   Enable MongoDB's free cloud-based monitoring service, which will then receive and display
   metrics about your deployment (disk utilization, CPU, operation statistics, etc).
   
   The monitoring data will be available on a MongoDB website with a unique URL accessible to you
   and anyone you share the URL with. MongoDB may use this information to make product
   improvements and to suggest MongoDB products and deployment options to you.
   
   To enable free monitoring, run the following command: db.enableFreeMonitoring()
   To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
------

Warning: Found ~/.mongorc.js, but not ~/.mongoshrc.js. ~/.mongorc.js will not be loaded.
  You may want to copy or rename ~/.mongorc.js to ~/.mongoshrc.js.
test> show dbs
admin   132.00 KiB
config   96.00 KiB
local    72.00 KiB
test> use company
switched to db company
company> db.createCollection("employee");
{ ok: 1 }
company> show collections;
employee
company> db.employee.insertOne({"emp_id":1,"emp_name":"Krishna","emp_city":"Akurdi","emp_salary":45000});
{
  acknowledged: true,
  insertedId: ObjectId("63714b34cec543e041f3184e")
}
company> db.employee.insertOne({"emp_id":2,"emp_name":"Govind","emp_city":"Pimpri","emp_salary":65000});
{
  acknowledged: true,
  insertedId: ObjectId("63714b67cec543e041f3184f")
}
company> db.employee.insertMany([{"emp_id":3,"emp_name":"Madhav","emp_city":"Pune","emp_salary":50000},
... {"emp_id":4,"emp_name":"Murlidhar","emp_city":"Mumbai","emp_salary":80000},
... {"emp_id":5,"emp_name":"Vasudev","emp_city":"Nagar","emp_salary":70000},
... {"emp_id":6,"emp_name":"Narayan","emp_city":"Lonavla","emp_salary":95000}]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("63714c4acec543e041f31850"),
    '1': ObjectId("63714c4acec543e041f31851"),
    '2': ObjectId("63714c4acec543e041f31852"),
    '3': ObjectId("63714c4acec543e041f31853")
  }
}
company> db.employee.find().pretty();
[
  {
    _id: ObjectId("63714b34cec543e041f3184e"),
    emp_id: 1,
    emp_name: 'Krishna',
    emp_city: 'Akurdi',
    emp_salary: 45000
  },
  {
    _id: ObjectId("63714b67cec543e041f3184f"),
    emp_id: 2,
    emp_name: 'Govind',
    emp_city: 'Pimpri',
    emp_salary: 65000
  },
  {
    _id: ObjectId("63714c4acec543e041f31850"),
    emp_id: 3,
    emp_name: 'Madhav',
    emp_city: 'Pune',
    emp_salary: 50000
  },
  {
    _id: ObjectId("63714c4acec543e041f31851"),
    emp_id: 4,
    emp_name: 'Murlidhar',
    emp_city: 'Mumbai',
    emp_salary: 80000
  },
  {
    _id: ObjectId("63714c4acec543e041f31852"),
    emp_id: 5,
    emp_name: 'Vasudev',
    emp_city: 'Nagar',
    emp_salary: 70000
  },
  {
    _id: ObjectId("63714c4acec543e041f31853"),
    emp_id: 6,
    emp_name: 'Narayan',
    emp_city: 'Lonavla',
    emp_salary: 95000
  }
]

// Creating an Index

company> db.employee.createIndex({emp_id:1});
emp_id_1
company> db.employee.getIndexes();
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { emp_id: 1 }, name: 'emp_id_1' }
]

// Sorting in Ascending Order

company> db.employee.find().sort({emp_id:1});
[
  {
    _id: ObjectId("63714b34cec543e041f3184e"),
    emp_id: 1,
    emp_name: 'Krishna',
    emp_city: 'Akurdi',
    emp_salary: 45000
  },
  {
    _id: ObjectId("63714b67cec543e041f3184f"),
    emp_id: 2,
    emp_name: 'Govind',
    emp_city: 'Pimpri',
    emp_salary: 65000
  },
  {
    _id: ObjectId("63714c4acec543e041f31850"),
    emp_id: 3,
    emp_name: 'Madhav',
    emp_city: 'Pune',
    emp_salary: 50000
  },
  {
    _id: ObjectId("63714c4acec543e041f31851"),
    emp_id: 4,
    emp_name: 'Murlidhar',
    emp_city: 'Mumbai',
    emp_salary: 80000
  },
  {
    _id: ObjectId("63714c4acec543e041f31852"),
    emp_id: 5,
    emp_name: 'Vasudev',
    emp_city: 'Nagar',
    emp_salary: 70000
  },
  {
    _id: ObjectId("63714c4acec543e041f31853"),
    emp_id: 6,
    emp_name: 'Narayan',
    emp_city: 'Lonavla',
    emp_salary: 95000
  }
]

// Sorting in Descending Order

company> db.employee.find().sort({emp_id:-1});
[
  {
    _id: ObjectId("63714c4acec543e041f31853"),
    emp_id: 6,
    emp_name: 'Narayan',
    emp_city: 'Lonavla',
    emp_salary: 95000
  },
  {
    _id: ObjectId("63714c4acec543e041f31852"),
    emp_id: 5,
    emp_name: 'Vasudev',
    emp_city: 'Nagar',
    emp_salary: 70000
  },
  {
    _id: ObjectId("63714c4acec543e041f31851"),
    emp_id: 4,
    emp_name: 'Murlidhar',
    emp_city: 'Mumbai',
    emp_salary: 80000
  },
  {
    _id: ObjectId("63714c4acec543e041f31850"),
    emp_id: 3,
    emp_name: 'Madhav',
    emp_city: 'Pune',
    emp_salary: 50000
  },
  {
    _id: ObjectId("63714b67cec543e041f3184f"),
    emp_id: 2,
    emp_name: 'Govind',
    emp_city: 'Pimpri',
    emp_salary: 65000
  },
  {
    _id: ObjectId("63714b34cec543e041f3184e"),
    emp_id: 1,
    emp_name: 'Krishna',
    emp_city: 'Akurdi',
    emp_salary: 45000
  }
]

// Dropping an Index

company> db.employee.dropIndex({"emp_id":1});
{ nIndexesWas: 2, ok: 1 }

// Display all Indexes

company> db.employee.getIndexes();
[ { v: 2, key: { _id: 1 }, name: '_id_' } ]
company> db.employee.createIndex({emp_salary:1});
emp_salary_1
company> db.employee.getIndexes();
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { emp_salary: 1 }, name: 'emp_salary_1' }
]
company> db.employee.find().sort({emp_salary:1});
[
  {
    _id: ObjectId("63714b34cec543e041f3184e"),
    emp_id: 1,
    emp_name: 'Krishna',
    emp_city: 'Akurdi',
    emp_salary: 45000
  },
  {
    _id: ObjectId("63714c4acec543e041f31850"),
    emp_id: 3,
    emp_name: 'Madhav',
    emp_city: 'Pune',
    emp_salary: 50000
  },
  {
    _id: ObjectId("63714b67cec543e041f3184f"),
    emp_id: 2,
    emp_name: 'Govind',
    emp_city: 'Pimpri',
    emp_salary: 65000
  },
  {
    _id: ObjectId("63714c4acec543e041f31852"),
    emp_id: 5,
    emp_name: 'Vasudev',
    emp_city: 'Nagar',
    emp_salary: 70000
  },
  {
    _id: ObjectId("63714c4acec543e041f31851"),
    emp_id: 4,
    emp_name: 'Murlidhar',
    emp_city: 'Mumbai',
    emp_salary: 80000
  },
  {
    _id: ObjectId("63714c4acec543e041f31853"),
    emp_id: 6,
    emp_name: 'Narayan',
    emp_city: 'Lonavla',
    emp_salary: 95000
  }
]
company> db.employee.find().sort({emp_salary:-1});
[
  {
    _id: ObjectId("63714c4acec543e041f31853"),
    emp_id: 6,
    emp_name: 'Narayan',
    emp_city: 'Lonavla',
    emp_salary: 95000
  },
  {
    _id: ObjectId("63714c4acec543e041f31851"),
    emp_id: 4,
    emp_name: 'Murlidhar',
    emp_city: 'Mumbai',
    emp_salary: 80000
  },
  {
    _id: ObjectId("63714c4acec543e041f31852"),
    emp_id: 5,
    emp_name: 'Vasudev',
    emp_city: 'Nagar',
    emp_salary: 70000
  },
  {
    _id: ObjectId("63714b67cec543e041f3184f"),
    emp_id: 2,
    emp_name: 'Govind',
    emp_city: 'Pimpri',
    emp_salary: 65000
  },
  {
    _id: ObjectId("63714c4acec543e041f31850"),
    emp_id: 3,
    emp_name: 'Madhav',
    emp_city: 'Pune',
    emp_salary: 50000
  },
  {
    _id: ObjectId("63714b34cec543e041f3184e"),
    emp_id: 1,
    emp_name: 'Krishna',
    emp_city: 'Akurdi',
    emp_salary: 45000
  }
]
company> db.employee.dropIndex({"emp_salary":1});
{ nIndexesWas: 2, ok: 1 }
company> db.employee.getIndexes();
[ { v: 2, key: { _id: 1 }, name: '_id_' } ]
company> db.employee.update({"emp_city":"Pimpri"},{$set:{"emp_city":"Akurdi"}});
DeprecationWarning: Collection.update() is deprecated. Use updateOne, updateMany, or bulkWrite.
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
company> db.employee.updateOne({"emp_city":"Mumbai"},{$set:{"emp_city":"Pune"}});
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
company> db.employee.find().pretty();
[
  {
    _id: ObjectId("63714b34cec543e041f3184e"),
    emp_id: 1,
    emp_name: 'Krishna',
    emp_city: 'Akurdi',
    emp_salary: 45000
  },
  {
    _id: ObjectId("63714b67cec543e041f3184f"),
    emp_id: 2,
    emp_name: 'Govind',
    emp_city: 'Akurdi',
    emp_salary: 65000
  },
  {
    _id: ObjectId("63714c4acec543e041f31850"),
    emp_id: 3,
    emp_name: 'Madhav',
    emp_city: 'Pune',
    emp_salary: 50000
  },
  {
    _id: ObjectId("63714c4acec543e041f31851"),
    emp_id: 4,
    emp_name: 'Murlidhar',
    emp_city: 'Pune',
    emp_salary: 80000
  },
  {
    _id: ObjectId("63714c4acec543e041f31852"),
    emp_id: 5,
    emp_name: 'Vasudev',
    emp_city: 'Nagar',
    emp_salary: 70000
  },
  {
    _id: ObjectId("63714c4acec543e041f31853"),
    emp_id: 6,
    emp_name: 'Narayan',
    emp_city: 'Lonavla',
    emp_salary: 95000
  }
]

// Aggregate Operations

// Sum

company> db.employee.aggregate({$group:{"_id":"$emp_city", emp_salary:{$sum:"$emp_salary"}}});
[
  { _id: 'Pune', emp_salary: 130000 },
  { _id: 'Akurdi', emp_salary: 110000 },
  { _id: 'Nagar', emp_salary: 70000 },
  { _id: 'Lonavla', emp_salary: 95000 }
]

// Average

company> db.employee.aggregate({$group:{"_id":"$emp_city", emp_salary:{$avg:"$emp_salary"}}});
[
  { _id: 'Nagar', emp_salary: 70000 },
  { _id: 'Akurdi', emp_salary: 55000 },
  { _id: 'Pune', emp_salary: 65000 },
  { _id: 'Lonavla', emp_salary: 95000 }
]

// Minimum

company> db.employee.aggregate({$group:{"_id":"$emp_city", emp_salary:{$min:"$emp_salary"}}});
[
  { _id: 'Pune', emp_salary: 50000 },
  { _id: 'Akurdi', emp_salary: 45000 },
  { _id: 'Nagar', emp_salary: 70000 },
  { _id: 'Lonavla', emp_salary: 95000 }
]

// Maximum

company> db.employee.aggregate({$group:{"_id":"$emp_city", emp_salary:{$max:"$emp_salary"}}});
[
  { _id: 'Pune', emp_salary: 80000 },
  { _id: 'Akurdi', emp_salary: 65000 },
  { _id: 'Nagar', emp_salary: 70000 },
  { _id: 'Lonavla', emp_salary: 95000 }
]

// First 

company> db.employee.aggregate({$group:{"_id":"$emp_city", emp_salary:{$first:"$emp_salary"}}});
[
  { _id: 'Pune', emp_salary: 50000 },
  { _id: 'Akurdi', emp_salary: 45000 },
  { _id: 'Nagar', emp_salary: 70000 },
  { _id: 'Lonavla', emp_salary: 95000 }
]

// Last

company> db.employee.aggregate({$group:{"_id":"$emp_city", emp_salary:{$last:"$emp_salary"}}});
[
  { _id: 'Nagar', emp_salary: 70000 },
  { _id: 'Akurdi', emp_salary: 65000 },
  { _id: 'Pune', emp_salary: 80000 },
  { _id: 'Lonavla', emp_salary: 95000 }
]
company> quit();
ubuntu@ubuntu-virtual-machine:~$ 
