#!/bin/bash
#
# Mail utils

MAIL_DIR=~/Mail

get_inbox_subjects () {
  ls $MAIL_DIR/*/INBOX/*/* | while read file; do
    # Extracting subject
    subject=$(grep ^Subject: $file | cut -d: -f2-)
    [[ -z $subject ]] && subject=$(grep ^Subject: $file -A1 | tail -1)

    # Cleaning subject
    if [[ $subject =~ "=?iso-8859-1?Q?" ]]; then
      subject=$(sed -e "s/=?iso-8859-1?Q?//" \
        -e "s/?=$//" \
        -e "s/_/ /g" \
        -e "s/=E9/é/g" \
        -e "s/=EA/ê/g" \
        <<< $subject)
    fi

    # Displaying
    [[ -z $subject ]] && echo "Unknown subject" || echo $subject
  done
}
