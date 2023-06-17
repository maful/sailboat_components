const path = require('path');

require('esbuild')
  .build({
    entryPoints: ['application.js'],
    bundle: true,
    logLevel: 'info',
    target: "es2017",
    outdir: path.join(process.cwd(), 'app/assets/builds'),
    absWorkingDir: path.join(process.cwd(), 'app/javascript'),
  })
  .catch(() => process.exit(1));
