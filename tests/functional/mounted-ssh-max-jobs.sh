source common.sh

clearStore

(! nix-build ./simple.nix --extra-experimental-features mounted-ssh-store --builders "" --max-jobs 0 \
  --store 'mounted-ssh-ng://localhost') || \
  fail "Shouldn' t build if the max jobs is set to 0 and there are no builders specified"