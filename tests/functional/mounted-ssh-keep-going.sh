source common.sh

clearStore

# It tests that it should not build the good derivation without the --keep-going flag
(! nix-build ./mounted-ssh-keep-going.nix \
  --out-link $TEST_ROOT/result-from-mounted-remote \
  --store 'mounted-ssh-ng://localhost')

(! cat $TEST_ROOT/result-from-mounted-remote/hello | grepQuiet 'Hello World!') || \
  fail "Shouldn't have built because one derivation is failing"

# It tests that it should build the good derivation as we have the --keep-going flag
(! nix-build ./mounted-ssh-keep-going.nix --keep-going \
  --out-link $TEST_ROOT/result-from-mounted-remote-new \
  --store 'mounted-ssh-ng://localhost')

(cat $TEST_ROOT/result-from-mounted-remote-new/hello | grepQuiet 'Hello World!') || \
fail "Should have built despite the errors because of '--keep-going'"