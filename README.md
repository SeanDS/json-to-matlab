# json-to-matlab
Conversion of JSON objects to MATLAB structures.

This library takes a JSON-formatted object and converts it into a MATLAB structure, with the special feature that text-encoded 'inf' strings are converted into native MATLAB infinities.

## Requirements ##

Requires the JSON library provided by MathWorks, found [here](http://uk.mathworks.com/matlabcentral/fileexchange/42236-parse-json-text/). Just place the `JSON.m` file in the same directory as `loadParameters.m`.

## Usage ##

```matlab
parameters = loadParameters('/path/to/json/file')
```

Sean Leavey  
https://github.com/SeanDS