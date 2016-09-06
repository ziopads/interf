// // we need a handle to the socket to send our osc values
// var socket;
// var isConnected;



// var x, y;

// function setup() {
// 	createCanvas(512, 424);
// 	setupOsc(12000, 3334);
// }

// function draw() {
// 	background(0, 0, 255);
// 	fill(0, 255, 0);
// 	ellipse(x, y, 100, 100);
// 	fill(0);
// 	text("I'm p5.js", x-25, y);
// // send x,y over OSC to AbletonOSC 
// // 	if (isConnected) {
// // 		socket.emit('message', ['/wek/outputs', x, y]);
// // 	}
// }

// function receiveOsc(address, value) {
// 	console.log("received OSC: " + address + ", " + value);
	
// 	if (address == '/kinect') {
// 		x = value[0];
// 		y = value[1];
// 	}
// }

// // function sendOsc(address, value) {
// // 	socket.emit('message', [address].concat(value));
// // }

// // function setupOsc(oscPortIn, oscPortOut) {
// // 	var socket = io.connect('http://127.0.0.1', { port: 8081, rememberTransport: false });
// // 	socket.on('connect', function() {
// // 		socket.emit('config', {	
// // 			server: { port: oscPortIn,  host: '127.0.0.1'},
// // 			client: { port: oscPortOut, host: '127.0.0.1'}
// // 		});
// // 	});
// // 	socket.on('message', function(msg) {
// // 		if (msg[0] == '#bundle') {
// // 			for (var i=2; i<msg.length; i++) {
// // 				receiveOsc(msg[i][0], msg[i].splice(1));
// // 			}
// // 		} else {
// // 			receiveOsc(msg[0], msg.splice(1));
// // 		}
// // 	});
// // }




// function sendOsc(address, value) {
// 	socket.emit('message', [address, value]);
// }

// function setupOsc(oscPortIn, oscPortOut) {
// 	socket = io.connect('http://127.0.0.1', { port: 8081, rememberTransport: false });
// 	socket.on('connect', function() {
// 		socket.emit('config', {	
// 			server: { port: oscPortIn,  host: '127.0.0.1'},
// 			client: { port: oscPortOut, host: '127.0.0.1'}
// 		});
// 	});
// 	socket.on('connect', function() {
// 		isConnected = true;
// 	});
// 	socket.on('message', function(msg) {
// 		if (msg[0] == '#bundle') {
// 			for (var i=2; i<msg.length; i++) {
// 				receiveOsc(msg[i][0], msg[i].splice(1));
// 			}
// 		} else {
// 			receiveOsc(msg[0], msg.splice(1));
// 		}
// 	});
// }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

// // we need a handle to the socket to send our osc values
// var socket;
// var isConnected;

// var x, y;

// function setup() {
// 	createCanvas(512, 424);
// // 	setupOsc(12000, 3334);
// 	setupOsc(12009, 12000);
// // 	console.log()
// }

// function receiveOsc(address, value) {
// 	console.log("received OSC: " + address + ", " + value);
	
// 	if (address == '/kinect') {
// 		x = value[0];
// 		y = value[1];
// 	}
// }

// function draw() {
// 	background(0, 0, 255);
// 	fill(0, 255, 0);
// 	ellipse(x, y, 100, 100);
// 	fill(0);
// 	text("I'm p5.js", x-25, y);
// // // send x,y over OSC to AbletonOSC 
// 	if (isConnected) {
// 		socket.emit('message', ['/wek/outputs', x, y]);
// 	} 

// }



// // function sendOsc(address, value) {
// // 	socket.emit('message', [address].concat(value));
// // }

// // function setupOsc(oscPortIn, oscPortOut) {
// // 	var socket = io.connect('http://127.0.0.1', { port: 8081, rememberTransport: false });
// // 	socket.on('connect', function() {
// // 		socket.emit('config', {	
// // 			server: { port: oscPortIn,  host: '127.0.0.1'},
// // 			client: { port: oscPortOut, host: '127.0.0.1'}
// // 		});
// // 	});
// // 	socket.on('message', function(msg) {
// // 		if (msg[0] == '#bundle') {
// // 			for (var i=2; i<msg.length; i++) {
// // 				receiveOsc(msg[i][0], msg[i].splice(1));
// // 			}
// // 		} else {
// // 			receiveOsc(msg[0], msg.splice(1));
// // 		}
// // 	});
// // }




// function sendOsc(address, value) {
// 	socket.emit('message', [address, value]);
// }

// function setupOsc(oscPortIn, oscPortOut) {
// 	socket = io.connect('http://127.0.0.1', { port: 8081, rememberTransport: false });
// 	socket.on('connect', function() {
// 		socket.emit('config', {	
// 			server: { port: oscPortIn,  host: '127.0.0.1'},
// 			client: { port: oscPortOut, host: '127.0.0.1'}
// 		});
// 	});
// 	socket.on('connect', function() {
// 		isConnected = true;
// 	});
// 	socket.on('message', function(msg) {
// 		if (msg[0] == '#bundle') {
// 			for (var i=2; i<msg.length; i++) {
// 				receiveOsc(msg[i][0], msg[i].splice(1));
// 			}
// 		} else {
// 			receiveOsc(msg[0], msg.splice(1));
// 		}
// 	});
// }


//////////////////////////////////////////////////////////////////////////////////////////////////////////////

// // we need a handle to the socket to send our osc values
// var socket;
// var isConnected;

// var x, y;

// function setup() {
// 	createCanvas(800, 600);
// 	setupOsc(12009, 12000);
// }

// function draw() {
// 	background(0);
// 	fill(0, 255, 0);
// 	ellipse(x, y, 100, 100);
// // 	fill(0);
// // 	text("I'm p5.js", x-25, y);
// }

// function receiveOsc(address, value) {
// 	console.log("received OSC: " + address + ", " + value);
// }

// // function receiveOsc(address, value) {
// // 	console.log("received OSC: " + address + ", " + value);
	
// // 	if (address == '/kinect') {
// // 		x = value[0];
// // 		y = value[1];
// // 		var v1 = x;
// // 	}
// // }

// var x = mouseX;

// // send these over OSC to AbletonOSC after you've selected 8 parameters to modify
// if (isConnected) {
// 	socket.emit('message', ['/wek/outputs', x]);
// 	console.log(x);
// }

// function sendOsc(address, value) {
// 	socket.emit('message', [address, value]);
// }

// function setupOsc(oscPortIn, oscPortOut) {
// 	socket = io.connect('http://127.0.0.1', { port: 8081, rememberTransport: false });
// 	socket.on('connect', function() {
// 		socket.emit('config', {	
// 			server: { port: oscPortIn,  host: '127.0.0.1'},
// 			client: { port: oscPortOut, host: '127.0.0.1'}
// 		});
// 	});
// 	socket.on('connect', function() {
// 		isConnected = true;
// 	});
// 	socket.on('message', function(msg) {
// 		if (msg[0] == '#bundle') {
// 			for (var i=2; i<msg.length; i++) {
// 				receiveOsc(msg[i][0], msg[i].splice(1));
// 			}
// 		} else {
// 			receiveOsc(msg[0], msg.splice(1));
// 		}
// 	});
// }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// we need a handle to the socket to send our osc values
var socket;
var isConnected;

function setup() {
	createCanvas(800, 600);
	setupOsc(12009, 12000);
}

var v1 = 110;

function receiveOsc(address, value) {
	console.log("received OSC: " + address + ", " + value);
	if (address == '/kinect') {
		v1 = value[0]/512;
		console.log("v1: " + v1);
		console.log("Y: " + value[1]);
		// y = value[1];
	}
}

function draw() {
	background(0);

// 	var v1 = x;
	
	// send these over OSC to AbletonOSC after you've selected 8 parameters to modify
	if (isConnected) {
		socket.emit('message', ['/wek/outputs', v1]);
	}
}



// // function receiveOsc(address, value) {
// // 	console.log("received OSC: " + address + ", " + value);
	
// // 	if (address == '/kinect') {
// // 		x = value[0];
// // 		y = value[1];
// // 		var v1 = x;
// // 	}
// // }

function sendOsc(address, value) {
	socket.emit('message', [address, value]);
}

function setupOsc(oscPortIn, oscPortOut) {
	socket = io.connect('http://127.0.0.1', { port: 8081, rememberTransport: false });
	socket.on('connect', function() {
		socket.emit('config', {	
			server: { port: oscPortIn,  host: '127.0.0.1'},
			client: { port: oscPortOut, host: '127.0.0.1'}
		});
	});
	socket.on('connect', function() {
		isConnected = true;
	});
	socket.on('message', function(msg) {
		if (msg[0] == '#bundle') {
			for (var i=2; i<msg.length; i++) {
				receiveOsc(msg[i][0], msg[i].splice(1));
			}
		} else {
			receiveOsc(msg[0], msg.splice(1));
		}
	});
}
