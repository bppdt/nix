with import ./config.nix;

rec {
    failing = mkDerivation {
        name = "failing";
        buildCommand = false;
    };

    # make the good derivation sleep to ensure it runs after the failing derivation
    good = mkDerivation {
        name = "good";
        builder = "mkdir $out; sleep 5; echo Hello World! > $out";
    };
}