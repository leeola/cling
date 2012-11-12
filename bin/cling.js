#!/usr/bin/env node
// 
// # Default Entry
// 
// Our default entry point via package.json. *(Once compiled, that is.)*
// 
// **Note:** that this file is in JavaScript because CoffeeScript is
// currently unable to properly add hashbangs as this file has.
// 
require('./node/bin').exec()