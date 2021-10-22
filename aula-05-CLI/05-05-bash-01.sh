#!/bin/bash

sendMail()
{
    help_text="
    Add to your ~/.bashrc:\n
    export mailtrap_pass=YOUR_MAILTRAP_PASS
    export mailtrap_user=YOUR_MAILTRAP_USER";
    if [ -z $mailtrap_user ]; then
        echo -e "'mailtrap_user' not found in your env\n$help_text"
        exit 3
    fi

    if [ -z $mailtrap_pass ]; then
        echo -e "'mailtrap_pass' not found in your env\n$help_text"
        exit 3
    fi

    mailtrap_credentials="$mailtrap_user:$mailtrap_pass"

    to_mail="$1@example.com"
    to_name="$1"

    curl --ssl-reqd \
--url 'smtp://smtp.mailtrap.io:2525' \
--user $mailtrap_credentials \
--mail-from from@example.com \
--mail-rcpt $to_mail \
--upload-file - <<EOF
From: Magic Elves <from@example.com>
To: $to_name <$to_mail>
Subject: You are awesome!
Content-Type: multipart/alternative; boundary="boundary-string"

--boundary-string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Congrats for sending test email with Mailtrap!

Inspect it using the tabs above and learn how this email can be improved.
Now send your email using our fake SMTP server and integration of your choice!

Good luck! Hope it works.

--boundary-string
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body style="font-family: sans-serif;">
    <div style="display: block; margin: auto; max-width: 600px;" class="main">
      <h1 style="font-size: 18px; font-weight: bold; margin-top: 20px">Congrats for sending test email with Mailtrap!</h1>
      <p>Inspect it using the tabs you see above and learn how this email can be improved.</p>
      <img alt="Inspect with Tabs" src="https://assets-examples.mailtrap.io/integration-examples/welcome.png" style="width: 100%;">
      <p>Now send your email using our fake SMTP server and integration of your choice!</p>
      <p>Good luck! Hope it works.</p>
    </div>
    <!-- Example of invalid for email html/css, will be detected by Mailtrap: -->
    <style>
      .main { background-color: white; }
      a:hover { border-left-width: 1em; min-height: 2em; }
    </style>
  </body>
</html>

--boundary-string--
EOF
}


## Laço de repetição com for
for item in $(cat ./05-06-lista.txt);
do
    if [ $item != 'tiago' ] ;
    then
        sendMail "$item"
    fi
done
