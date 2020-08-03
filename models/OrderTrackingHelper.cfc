component singleton {

	property name='settings'      inject='coldbox:setting:inventory-helper';
	property name='apiAuthHelper' inject='ApiAuthHelper';

	public struct function insertRecord(
		required string cell,
		required string comments,
		required string dept,
		required string document,
		required string in_out,
		required string seq,
		required string uname,
		required string useimport = ''
	) {
		var authToken   = apiAuthHelper.getApiToken();
		var codeRequest = {
			'Row' : {
				'Document_Date' : arguments.Document_Date,
				'cell'          : arguments.cell,
				'comments'      : arguments.comments,
				'dept'          : arguments.dept,
				'document'      : arguments.document,
				'in_out'        : arguments.in_out,
				'seq'           : arguments.seq,
				'uname'         : arguments.uname,
				'useimport'     : arguments.useimport
			}
		};
		try {
			cfhttp(
				method  = 'POST',
				charset = 'utf-8',
				url     = settings.orderTrackingUrl,
				result  = 'result'
			) {
				cfhttpparam(
					type  = 'header',
					name  = 'Authorization',
					value = 'Bearer ' & authToken
				);
				cfhttpparam(
					type  = 'header',
					name  = 'Content-Type',
					value = 'application/x-www-form-urlencoded'
				);
				cfhttpparam(
					type  = 'body',
					name  = 'raw',
					value = serializeJSON( codeRequest )
				);
			};

			if (
				result.ResponseHeader[ 'Status_Code' ] == '200' ||
				result.ResponseHeader[ 'Status_Code' ] == '201'
			) {
				response.success = true;
				response.content = result.FileContent;
			} else {
				response.success = false;
				response.content = result.Statuscode;
			}
		} catch ( any e ) {
			response.success = false;
			response.content = 'Error: ' & e.message;
		}

		return response;
	}

}
