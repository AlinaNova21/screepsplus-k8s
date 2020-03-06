for S in {mmo,splus1,splus2,swc,botarena}
do
  kubectl -n loan delete secret/vk-config-$S
  kubectl -n loan create secret generic vk-config-$S \
    --from-file=$S/.settings.json \
    --from-file=$S/DB_LOCATION
done
