source common.sh

clearStore

(! nix-build ./simple.nix --extra-experimental-features mounted-ssh-store --builders "" --max-jobs 0 \
  --store 'mounted-ssh-ng://localhost') 