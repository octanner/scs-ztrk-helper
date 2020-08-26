# Ztrk Helper
![Master Branch Build Status(https://www.forgebox.io/view/ztrk-helper)](https://www.forgebox.io/api/v1/entry/ztrk-helper/badges/version)![Master Branch Download Status(https://www.forgebox.io/view/ztrk-helper)](https://www.forgebox.io/api/v1/entry/ztrk-helper/badges/downloads)

The PO team created a REST API to insert custom tracking records into the SAP table ZTRK. This helper will simplified the use and implementation of that REST api
...

## Getting Started
Get a copy of the module into your project
```
box install ztrk-helper
```

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

This Module asumes that you have a ZTRK table in SAP and that an API to insert records is available.

This Module have a dependency on another module called 'api-auth-helper'.  See the module documentation if it needs to be configure. [api-auth-helper](https://github.com/octanner/scs-api-auth-helper)

### Installing

*Step 1:* Override default apiUrl to send jobs to your own URL (one time change)
Making sure you add 'ztrk-helper' node to the moduleSettings object in the Coldbox.cfc (if not present add it inside of the configure() function )
```
    moduleSettings = {
            'ztrk-helper' : { 'baseUrl' : '[your endpoint API]' }
        }; 
```
*Step 2:* Instanciate your Model from your newly installed Module
Create a new property and inject the model of your choice. The pattern to inject its value is in this manner [Model]@[Module] 
```
    property name='ztrkHelper' inject='ztrkHelper@ztrk-helper';
```
*Step 3:* call the print() method and pass your data.
Once your property has been declared and injected with the model, you are ready to use it, here is and example of the minimum required parameters you need to pass:
```
    ztrkHelper.insert(
			cell      = '',
			comments  = ''),
			dept      = '',
			document  = '',
			inOut     = '',
			seq       = '',
			uname     = '',
			useimport = ''
		);
```
*Note that all fields are required.* 

## Deployment


## Authors & Contributors

* **Eduardo Gomez** - [Eduardo Gomez](https://github.com/egomezm)

## References

* [ColdBox Platform](https://www.ortussolutions.com/products/coldbox)