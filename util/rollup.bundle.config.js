import babel from 'rollup-plugin-babel';
import npm from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';
import uglify from 'rollup-plugin-uglify';

export default {
  entry: 'src/index.js',
  dest: 'dist/react-range-master.js',
  format: 'umd',
  external: [
    'react',
    'react-dom'
  ],
  globals: {
    'react': 'React',
    'react-dom': 'ReactDOM'
  },
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
    } ),

    uglify()
  ]
};
