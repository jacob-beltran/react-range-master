import babel from 'rollup-plugin-babel';
import npm from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';

export default {
  entry: 'src/index.js',
  dest: 'lib/index.js',
  format: 'cjs',
  external: [
    'react',
    'react-dom',
    'js-shortid',
    'radium',
  ],
  plugins: [

    babel( {
      exclude: 'node_modules/**',
      presets: [ 'es2015-rollup', 'react', 'stage-0' ]
    } ),

    npm( {
      jsnext: true,
      main: true
    } ),

    commonjs( {
      include: 'node_modules/**',
      namedExports: {}
    } )
  ]
};
