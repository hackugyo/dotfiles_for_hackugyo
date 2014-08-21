var test = require('tape');
var stringify = require('../');

test('toJSON function', function (t) {
    t.plan(1);
    var obj = { one: 1, two: 2, toJSON: function() { return { one: 1 }; } };
    t.equal(stringify(obj), '{"one":1}' );
});
