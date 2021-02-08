#!/bin/bash

_SROOT=${_SROOT:-/root}

if [ "$SIGN_BUILDS" = true ]; then
  if [ -z "$(ls -A "$KEYS_DIR")" ]; then
    echo ">> [$(date)] SIGN_BUILDS = true but empty \$KEYS_DIR, generating new keys"
    for c in releasekey platform shared media networkstack; do
      echo ">> [$(date)]  Generating $c..."
      $_SROOT/make_key "$KEYS_DIR/$c" "$KEYS_SUBJECT" <<< '' &> /dev/null
    done
  else
    for c in releasekey platform shared media networkstack; do
      for e in pk8 x509.pem; do
        if [ ! -f "$KEYS_DIR/$c.$e" ]; then
          echo ">> [$(date)] SIGN_BUILDS = true and not empty \$KEYS_DIR, but \"\$KEYS_DIR/$c.$e\" is missing"
          exit 1
        fi
      done
    done
  fi

  for c in cyngn{-priv,}-app testkey; do
    for e in pk8 x509.pem; do
      ln -s releasekey.$e "$KEYS_DIR/$c.$e" 2> /dev/null
    done
  done
fi

