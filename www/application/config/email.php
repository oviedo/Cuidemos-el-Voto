<?php
/**
 * Config Mail Server
 * Some providers require a full email address as username
 */
$config['username'] = "reporte@cuidemoselvoto.org";


/**
 * Config Mail Server
 */
$config['password'] = "PASSWORD";


/**
 * Config Mail Server
 * Common Ports: 25, 110, 995 (Gmail POP3 SSL), 993 (Gmail IMAP SSL)
 */
$config['port'] = 993;


/**
 * Config Mail Server
 * Examples:
 * - mail.yourwebsite.com
 * - imap.gmail.com
 * - pop.gmail.com
 */
$config['server'] = "imap.gmail.com";


/**
 * Config Mail Server Type
 * Examples:
 * - pop3
 * - imap
 */
$config['servertype'] = "imap";


/**
 * Enable or disable SSL
 */
$config['ssl'] = true;
?>