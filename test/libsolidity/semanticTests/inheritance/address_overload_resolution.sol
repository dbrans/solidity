contract C {
    function balance() public returns (uint256) {
        return 1;
    }

    function transfer(uint256 amount) public returns (uint256) {
        return amount;
    }
}


contract D {
    function f() public returns (uint256) {
        return (new C()).balance();
    }

    function g() public returns (uint256) {
        return (new C()).transfer(5);
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 1
// gas irOptimized: 78605
// gas legacy: 114884
// g() -> 5
// gas irOptimized: 78694
// gas legacy: 115430
