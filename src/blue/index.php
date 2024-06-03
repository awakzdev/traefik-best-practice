<?php
$hostname = gethostname();
$host = 'mariadb';
$db   = 'mariadb';
$user = 'admin';
$pass = 'admin';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

echo "<html><body style='background-color: blue;'><h1>PHP-FPM Blue Container</h1>";
echo "<p>PHP Version: " . phpversion() . "</p>";
echo "<p>Container Hostname: " . $hostname . "</p></body></html>";

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    echo "Successfully connected to $host";
} catch (\PDOException $e) {
    echo "Connection to $host failed: " . $e->getMessage();
    exit;
}
?>