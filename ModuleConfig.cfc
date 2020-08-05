component {

	// Module Properties
	this.title              = 'ZTRK Helper';
	this.name               = 'ztrk-helper';
	this.author             = 'Eduardo Gomez';
	this.webUrl             = 'https://github.com/octanner/scs-ztrk-helper';
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup   = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;

	function configure() {
		binder.map( 'ApiAuthHelper' ).to( '#moduleMapping#.modules.api-auth-helper.models.ApiAuthHelper' );

		settings = { 'baseUrl' : 'https://any-api.com/' };
	}

}
