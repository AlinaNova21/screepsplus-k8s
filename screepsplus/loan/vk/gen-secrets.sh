for S in {mmo,season,splus1,splus2,swc,botarena}
do
  # kubectl -n loan delete secret/vk-config-$S
  kubectl -n loan create secret generic vk-config-$S \
    --from-file=$S/.settings.json \
    "--from-literal=DB_LOCATION=mysql://screeps:screeps@mysql.db.svc:3306/vk_$S" \
    --dry-run=client -o yaml | kubectl -n loan apply -f -
    # --from-file=$S/DB_LOCATION \
done
