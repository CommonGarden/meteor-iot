import babel from 'rollup-plugin-babel';
import babelrc from 'babelrc-rollup';

let pkg = require('./package.json');
let external = Object.keys(pkg.dependencies);

export default {
<<<<<<< HEAD
  entry: 'lib/Grow.js',
=======
  entry: 'lib/Thing.js',
>>>>>>> thing
  plugins: [babel(babelrc())],
  external: external,
  targets: [
    {
      dest: pkg['main'],
      format: 'cjs',
      moduleName: 'rollupStarterProject',
      sourceMap: true
<<<<<<< HEAD
    },
    {
      dest: pkg['jsnext:main'],
      format: 'es',
      sourceMap: true
    }
  ]
};
=======
    }
  ]
};
>>>>>>> thing
