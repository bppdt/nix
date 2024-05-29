source common.sh

enableFeatures mounted-ssh-store

(! nix-build ./simple.nix --builders "" --max-jobs 0 \
  --store 'mounted-ssh-ng://localhost')