
<?php
require_once 'connexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // TODO 1 : Récupérer les données depuis $_POST
    $personne_id = $_POST['personne_id'] ?? '';
    $poids = $_POST['poids'] ?? '';
    $taille = $_POST['taille'] ?? '';

    // TODO 2 : Valider les données côté serveur
    if (
        !filter_var($personne_id, FILTER_VALIDATE_INT) ||
        $personne_id <= 0 ||
        !is_numeric($poids) ||
        !is_numeric($taille) ||
        $poids < 20 || $poids > 300 ||
        $taille < 0.5 || $taille > 2.5
    ) {
        die("Erreur : données invalides.");
    }

    // Convertir les valeurs numériques
    $poids = (float) $poids;
    $taille = (float) $taille;

    // TODO 3 : Calculer l'IMC et déterminer la catégorie
    $imc = round($poids / ($taille * $taille), 1);

    if ($imc < 18.5) {
        $categorie = 'sous poids';
    } elseif ($imc < 25) {
        $categorie = 'normal';
    } elseif ($imc < 30) {
        $categorie = 'surpoids';
    } else {
        $categorie = 'obésité';
    }

    // TODO 4 : Préparer et exécuter la requête INSERT
    $sql = "INSERT INTO mesures
            (personne_id, poids, taille, imc, categorie)
            VALUES (?, ?, ?, ?, ?)";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        $personne_id,
        $poids,
        $taille,
        $imc,
        $categorie
    ]);
}

// TODO 5 : Rediriger vers index.php
header('Location: index.php');
exit;
