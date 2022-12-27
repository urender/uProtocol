// Automatically uReader from ./schema-generated/admin_method.json - do not edit!
"use strict";

function matchUcCidr4(value) {
	let m = match(value, /^(auto|[0-9.]+)\/([0-9]+)$/);
	return m ? ((m[1] == "auto" || length(iptoarr(m[1])) == 4) && +m[2] <= 32) : false;
}

function matchUcCidr6(value) {
	let m = match(value, /^(auto|[0-9a-fA-F:.]+)\/([0-9]+)$/);
	return m ? ((m[1] == "auto" || length(iptoarr(m[1])) == 16) && +m[2] <= 128) : false;
}

function matchUcCidr(value) {
	let m = match(value, /^(auto|[0-9a-fA-F:.]+)\/([0-9]+)$/);
	if (!m) return false;
	let l = (m[1] == "auto") ? 16 : length(iptoarr(m[1]));
	return (l > 0 && +m[2] <= (l * 8));
}

function matchUcMac(value) {
	return match(value, /^[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]$/i);
}

function matchUcHost(value) {
	if (length(iptoarr(value)) != 0) return true;
	if (length(value) > 255) return false;
	let labels = split(value, ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 0);
}

function matchUcTimeout(value) {
	return match(value, /^[0-9]+[smhdw]$/);
}

function matchUcBase64(value) {
	return b64dec(value) != null;
}

function matchUcPortrange(value) {
	let ports = match(value, /^([0-9]|[1-9][0-9]*)(-([0-9]|[1-9][0-9]*))?$/);
	if (!ports) return false;
	let min = +ports[1], max = ports[2] ? +ports[3] : min;
	return (min <= 65535 && max <= 65535 && max >= min);
}

function matchHostname(value) {
	if (length(value) > 255) return false;
	let labels = split(value, ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]{1,2}|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 0);
}

function matchUcFqdn(value) {
	if (length(value) > 255) return false;
	let labels = split(value, ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]{1,2}|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 1);
}

function matchUcIp(value) {
	return (length(iptoarr(value)) == 4 || length(iptoarr(value)) == 16);
}

function matchIpv4(value) {
	return (length(iptoarr(value)) == 4);
}

function matchIpv6(value) {
	return (length(iptoarr(value)) == 16);
}

function matchUri(value) {
	if (index(value, "data:") == 0) return true;
	let m = match(value, /^[a-z+-]+:\/\/([^\/]+).*$/);
	if (!m) return false;
	if (length(iptoarr(m[1])) != 0) return true;
	if (length(m[1]) > 255) return false;
	let labels = split(m[1], ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 0);
}

function instantiateHttps_urenderOrgSchemaV1MethodConfigure(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseMethod(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "configure")
				push(errors, [ location, "must have value \"configure\"" ]);

			return value;
		}

		if (exists(value, "method")) {
			obj.method = parseMethod(location + "/method", value["method"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseParams(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseSerial(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "serial")) {
					obj.serial = parseSerial(location + "/serial", value["serial"], errors);
				}
				else {
					push(errors, [ location, "is required" ]);
				}

				function parseConfiguration(location, value, errors) {
					if (type(value) == "object") {
						let obj = { ...value };

						function parseUuid(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "uuid")) {
							obj.uuid = parseUuid(location + "/uuid", value["uuid"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				if (exists(value, "configuration")) {
					obj.configuration = parseConfiguration(location + "/configuration", value["configuration"], errors);
				}
				else {
					push(errors, [ location, "is required" ]);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "params")) {
			obj.params = parseParams(location + "/params", value["params"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateHttps_urenderOrgSchemaV1MethodDevices(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseMethod(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "devices")
				push(errors, [ location, "must have value \"devices\"" ]);

			return value;
		}

		if (exists(value, "method")) {
			obj.method = parseMethod(location + "/method", value["method"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseParams(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseSerial(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "serial")) {
					obj.serial = parseSerial(location + "/serial", value["serial"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "params")) {
			obj.params = parseParams(location + "/params", value["params"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function newURenderState(location, value, errors) {
	function parseVariant0(location, value, errors) {
		if (type(value) == "object") {
			let obj = {};

			function parseJsonrpc(location, value, errors) {
				if (type(value) != "string")
					push(errors, [ location, "must be of type string" ]);

				if (value != "2.0")
					push(errors, [ location, "must have value \"2.0\"" ]);

				return value;
			}

			if (exists(value, "jsonrpc")) {
				obj.jsonrpc = parseJsonrpc(location + "/jsonrpc", value["jsonrpc"], errors);
			}
			else {
				push(errors, [ location, "is required" ]);
			}

			function parseId(location, value, errors) {
				return value;
			}

			if (exists(value, "id")) {
				obj.id = parseId(location + "/id", value["id"], errors);
			}
			else {
				push(errors, [ location, "is required" ]);
			}

			return obj;
		}

		if (type(value) != "object")
			push(errors, [ location, "must be of type object" ]);

		return value;
	}

	function parseVariant1(location, value, errors) {
		function parseVariant0(location, value, errors) {
			value = instantiateHttps_urenderOrgSchemaV1MethodConfigure(location, value, errors);

			return value;
		}

		function parseVariant1(location, value, errors) {
			value = instantiateHttps_urenderOrgSchemaV1MethodDevices(location, value, errors);

			return value;
		}

		let success = 0, tryval, tryerr, vvalue = null, verrors = [];

		tryerr = [];
		tryval = parseVariant0(location, value, tryerr);
		if (!length(tryerr)) {
			if (type(vvalue) == "object" && type(tryval) == "object")
				vvalue = { ...vvalue, ...tryval };
			else
				vvalue = tryval;

			success++;
		}
		else {
			push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
		}

		tryerr = [];
		tryval = parseVariant1(location, value, tryerr);
		if (!length(tryerr)) {
			if (type(vvalue) == "object" && type(tryval) == "object")
				vvalue = { ...vvalue, ...tryval };
			else
				vvalue = tryval;

			success++;
		}
		else {
			push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
		}

		if (success != 1) {
			if (length(verrors))
				push(errors, [ location, "must match exactly one of the following constraints:\n" + join("\n- or -\n", verrors) ]);
			else
				push(errors, [ location, "must match only one variant" ]);
			return null;
		}

		value = vvalue;

		return value;
	}

	let success = 0, tryval, tryerr, vvalue = null, verrors = [];

	tryerr = [];
	tryval = parseVariant0(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	tryerr = [];
	tryval = parseVariant1(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	if (success != 2) {
		if (length(verrors))
			push(errors, [ location, "must match all of the following constraints:\n" + join("\n- or -\n", verrors) ]);
		else
			push(errors, [ location, "must match only one variant" ]);
		return null;
	}

	value = vvalue;

	return value;
}

export function validate(value, errors) {
	let err = [];
	let res = newURenderState("", value, err);
	if (errors) push(errors, ...map(err, e => "[E] (In " + e[0] + ") Value " + e[1]));
	return length(err) ? null : res;
};
