'use strict';

const https = require('https');
const fs = require('fs');

// Constants
const certDir = `/usr/src/app/ssl`;
const options = {
  key: fs.readFileSync(`${certDir}/cert.key`),
  cert: fs.readFileSync(`${certDir}/cert.pem`),
  ca: fs.readFileSync(`${certDir}/ca.pem`)
};

https.createServer(options, (req, res) => {
    if (req.url === '/oauth2') {
        res.writeHead(200, {'Content-Type': 'text/plain'});
        console.log("/oauth2");
        res.end(`hello world nodejs SSL /oauth2\n`);
    } else {
        if (req.url === '/oauth2/callback') {
            res.writeHead(200, {'Content-Type': 'text/plain'});
            console.log("/oauth2/callback");
            res.end(`hello world nodejs SSL /oauth2/callback\n`);
        } else {
            if (req.url === '/') {
                res.writeHead(200, {'Content-Type': 'text/plain'});
                res.end(`hello world nodejs SSL SSO\n`);
                console.log("/");
            }
        }
    }

}).listen(8765);
