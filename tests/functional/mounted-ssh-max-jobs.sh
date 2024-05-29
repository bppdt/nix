source common.sh

clearStore

(nix-build ./simple.nix --builders "" --max-jobs 0 \
  --store 'mounted-ssh-ng://localhost') 