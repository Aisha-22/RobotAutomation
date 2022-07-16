***API and Web Service***

* Simple Definition: Service Available over web(or network)

* Provide a way to communicate between  2 machines/ applications

***Difference between Web Service and API***

1. WebService always need network for it operations but API may or may not need network for its operations.
2. WeService can be used by following communication: Soap, Rest, XML RPC, but API can be communicated through other ways like CURL calls
3. API can also be exposed in number of ways like JAR, DLL, XML over Http, Json over Http etc
4. All WebService can be considered and AIP, but API are not WebService (All WebService are deployed on the server)

**Difference Between SOAP and REST**

**SOAP**
* SOAP is a protocol.
* SOAP stands for Simple Object Assess Protocol
* SOAP uses service interfaces to expose the business logic
* SOAP defines standards to strictly followed 
* SOAP requires more bandwidth and resource than REST
* SOAP defines its own security
* SOAP permits XML data format only

**REST**
* REST is an architectural style
* REST stand for Representational State Transfer
* REST uses URI to expose business logic
* REST does not define too much standards like SOAP
* REST requires less bandwidth and resource than SOAP
* RESTful web services inherits security measures from the underlying transport
* REST permits different data format such as plain text, HTML, XML, JSON etc

**REST API Request Methods**
1. GET: Retrieving some data from the server 
2. POST: Whenever we add new data 
3. PUT: Whenever we want to update data
4. DELETE: When we want to delete data 
5. PATCH: Same as PUT, but no need to send data which you do not want to update
    6. HEAD
    7. OPTIONS
    8. TRACE

**Basic JSON Understanding**

***Learn JSON format***
* JSON (JavaScript Object Notation) is lightweight data interchange format.
* JSON is a syntax for storing and exchanging data
* Data is placed in JSON in the format of key and value pair 
* Value could be an array
* Value can have further key-value(Call it object)"

***How to Write Json Path***
* What is JSON Path
* What is the use of JSON Path
* How to write simple Json Path (jsonpath.com)
* How to write complex Json Path with Array
* How to write complex Json Path with object