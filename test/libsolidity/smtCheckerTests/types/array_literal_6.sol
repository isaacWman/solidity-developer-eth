contract C
{
	function f() public pure {
		uint[3] memory a = [uint(1), 2, 3];
		uint[4] memory b = [uint(1), 2, 4, 3];
		uint[4] memory c = b;
		assert(a.length == c.length); // fails
		assert(a[0] == c[0]);
		assert(a[1] == c[1]);
		assert(a[2] == c[2]); // fails
		assert(a[2] == c[3]);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (146-174): CHC: Assertion violation happens here.
// Warning 6328: (235-255): CHC: Assertion violation happens here.
// Info 1391: CHC: 11 verification condition(s) proved safe! Enable the model checker option "show proved safe" to see all of them.
