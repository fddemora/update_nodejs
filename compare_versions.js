const https = require('https');
const { exec } = require('child_process');
js_version = ''


exec('node -v', (error, stdout, stderr) => {
  if (error) {
    //console.error(`exec error: ${error}`);
    return;
  }
  //console.log(`stdout: ${stdout}`);
  //console.error(`stderr: ${stderr}`);
  js_version = stdout;
});

const options = {
    hostname: 'nodejs.org',
    path: '/dist/index.json'
};

const req = https.request(options, (res) => {
    let data = '';

    res.on('data', (chunk) => {
        data += chunk;
    });

    res.on('end', () => {
        const jsonData = JSON.parse(data);
    let result = jsonData.filter(index => index.version.startsWith("v22")); // Current LTS

    
	if (result[0].version !== js_version.replace(/[ \n]/g,'')){ 
        // Ordered list from most recent
        console.log(result[0].version)
    }          
    else {
        // display nothing for bash to handle. 
    }
    });
});

req.on('error', (error) => {
    console.error(`Error fetching latest version: ${error}`);
});

req.end();