AUTOMATIC FFUFER

questo script e stato testato e basato sul modulo ffuf del sito hackthebox.
provate anche voi se volete per capirlo meglio.

All'inzio vi verra chiesto di creare una cartella e dare il nome ai file da inserire nella stessa
potete scegliere il tipo di estensione preferito o all per tutti.
I file verranno salvati nella cartella precedentemente scelta o creata per mantenere l ambiente di lavoro pulito e ordinato.
Ho incluso alcuni file da seclist fra cui directory DNS extension ids ma si puo inserire qualsiasi percorso che porta a una wordlist.
in ultimo potete inserire un flag di ffuf per vedere la lista dei flag scrivere alien altrimenti premere invio e inserire i flag.

1 directory FUZZ inserire l indirizzo preferibilmente facendo copia e incolla direttamente dalla pagina web
2 extension fuzzing esempio riportato dal modulo htb -u http://SERVER_IP:PORT/blog/indexFUZZ
3 page fuzzing
enter target
prima inserire solo l indirizzo del target e premere invio
format http:// or https://target.com
 https://target.com
 inserire l estensione
 enter extension
ex: php txt html
infine l output sara questo
https://sma.mc/FUZZ.php
4 seleziona target
  seleziona profondita scanning
  seleziona estensione
5 per questo scan ho deciso che e piu facile inserire voi stessi il flag FUZZ quindi inserire l indirizzo cosi https://FUZZ.target.com/
6 per questa opzione inserire prima solo http:// o https://
  poi inserire il target
  output sara simile a questo -u http://target.com:PORT/ -H 'Host: FUZZ.target.com'
7 esempio di scan presi dal modulo ffuf di htb
 -u http://admin.academy.htb:PORT/admin/admin.php?FUZZ=key -fs xxx
8
 -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'FUZZ=key' -H 'Content-Type: application/x-www-form-urlencoded'
9
 -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'id=FUZZ' -H 'Content-Type: application/x-www-form-urlencoded



