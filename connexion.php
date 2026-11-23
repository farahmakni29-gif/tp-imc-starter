<?php
// ==========================================================
// EXERCICE 7.1 : CONNEXION À LA BASE DE DONNÉES VIA PDO
// ==========================================================
 
$host = 'localhost';
$dbname = 'imc_db';
$username = 'root';
$password = ''; // Vide par défaut sur XAMPP
 
try {
   // TODO 1 : Instancier l'objet PDO
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $username,
        $password
    );

    // TODO 2 : Configurer le mode d'erreur
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
