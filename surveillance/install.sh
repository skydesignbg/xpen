#!/usr/bin/env ash

if [ "${1}" = "late" ]; then
  echo "Creating service to exec Surveillance Patch"
  cp -v /usr/bin/surveillance.sh /tmpRoot/usr/bin/surveillance.sh
  DEST="/tmpRoot/lib/systemd/system/surveillance.service"
  echo "[Unit]"                                                                >${DEST}
  echo "Description=Surveillance Patch"                                       >>${DEST}
  echo                                                                        >>${DEST}
  echo "[Service]"                                                            >>${DEST}
  echo "Type=oneshot"                                                         >>${DEST}
  echo "RemainAfterExit=true"                                                 >>${DEST}
  echo "ExecStart=/usr/bin/surveillance.sh"                                   >>${DEST}
  echo "ExecStop=/usr/bin/surveillance.sh"                                    >>${DEST}
  echo                                                                        >>${DEST}
  echo "[Install]"                                                            >>${DEST}
  echo "WantedBy=multi-user.target"                                           >>${DEST}

  mkdir -p /tmpRoot/lib/systemd/system/multi-user.target.wants
  ln -sf /lib/systemd/system/surveillance.service /tmpRoot/lib/systemd/system/multi-user.target.wants/surveillance.service
fi
