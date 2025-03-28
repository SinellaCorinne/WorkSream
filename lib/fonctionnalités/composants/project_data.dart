// project_data.dart
class Task {
  final String description;
  bool isCompleted;

  Task({required this.description, this.isCompleted = false});
}

class Project {
  final String title;
  final List<Task> tasks;

  Project({required this.title, required this.tasks});
}

List<Project> projects = [
  Project(
    title: "Conception d'App de Recettes de Cuisine",
    tasks: [
      Task(description: "Recherche des fonctionnalités de base"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des API de recettes"),
      Task(description: "Tests unitaires et d'intégration"),
      Task(description: "Déploiement de la version bêta"),
      Task(description: "Collecte des retours utilisateurs"),
      Task(description: "Correction des bugs"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Préparation du lancement"),
      Task(description: "Marketing et promotion"),
    ],
  ),
  Project(
    title: "Conception de Système de Gestion de Bibliothèque",
    tasks: [
      Task(description: "Analyse des besoins des utilisateurs"),
      Task(description: "Conception de la base de données"),
      Task(description: "Développement de l'interface utilisateur"),
      Task(description: "Intégration des fonctionnalités de gestion des livres"),
      Task(description: "Tests de la sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Formation des utilisateurs"),
      Task(description: "Support et maintenance"),
      Task(description: "Ajout de fonctionnalités supplémentaires"),
      Task(description: "Mise à jour régulière"),
      Task(description: "Documentation du système"),
      Task(description: "Évaluation des performances"),
    ],
  ),
  Project(
    title: "SIGES - Système Intégré de Gestion des Écoles",
    tasks: [
      Task(description: "Étude des processus scolaires"),
      Task(description: "Conception de l'architecture du système"),
      Task(description: "Développement des modules administratifs"),
      Task(description: "Intégration des modules académiques"),
      Task(description: "Tests de validation"),
      Task(description: "Formation des administrateurs"),
      Task(description: "Déploiement dans les écoles pilotes"),
      Task(description: "Collecte des retours des utilisateurs"),
      Task(description: "Amélioration continue"),
      Task(description: "Support technique"),
      Task(description: "Expansion à d'autres écoles"),
      Task(description: "Rapports et analyses"),
    ],
  ),
  Project(
    title: "Développement d'une Plateforme de E-commerce",
    tasks: [
      Task(description: "Analyse du marché"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des passerelles de paiement"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Marketing digital"),
      Task(description: "Support client"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Expansion à de nouveaux marchés"),
      Task(description: "Analyse des données utilisateurs"),
    ],
  ),
  Project(
    title: "Création d'un Réseau Social pour Entreprises",
    tasks: [
      Task(description: "Étude de faisabilité"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des fonctionnalités de réseau"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Marketing ciblé"),
      Task(description: "Support utilisateur"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Expansion à de nouveaux secteurs"),
      Task(description: "Analyse des interactions utilisateurs"),
    ],
  ),
  Project(
    title: "Développement d'une Application de Fitness",
    tasks: [
      Task(description: "Recherche des besoins des utilisateurs"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des fonctionnalités de suivi"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Marketing digital"),
      Task(description: "Support client"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Expansion à de nouveaux marchés"),
      Task(description: "Analyse des données utilisateurs"),
    ],
  ),
  Project(
    title: "Conception d'un Système de Gestion de Projet",
    tasks: [
      Task(description: "Analyse des besoins des utilisateurs"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des fonctionnalités de gestion"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Formation des utilisateurs"),
      Task(description: "Support et maintenance"),
      Task(description: "Ajout de fonctionnalités supplémentaires"),
      Task(description: "Mise à jour régulière"),
      Task(description: "Documentation du système"),
      Task(description: "Évaluation des performances"),
    ],
  ),
  Project(
    title: "Développement d'une Application de Réalité Augmentée",
    tasks: [
      Task(description: "Recherche et développement"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des fonctionnalités AR"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Marketing digital"),
      Task(description: "Support client"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Expansion à de nouveaux marchés"),
      Task(description: "Analyse des données utilisateurs"),
    ],
  ),
  Project(
    title: "Création d'une Plateforme de Streaming Vidéo",
    tasks: [
      Task(description: "Analyse du marché"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des fonctionnalités de streaming"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Marketing digital"),
      Task(description: "Support client"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Expansion à de nouveaux marchés"),
      Task(description: "Analyse des données utilisateurs"),
    ],
  ),
  Project(
    title: "Développement d'une Application de Réservation de Voyages",
    tasks: [
      Task(description: "Étude de marché"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des API de réservation"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Marketing digital"),
      Task(description: "Support client"),
      Task(description: "Ajout de nouvelles fonctionnalités"),
      Task(description: "Optimisation des performances"),
      Task(description: "Expansion à de nouveaux marchés"),
      Task(description: "Analyse des données utilisateurs"),
    ],
  ),
  Project(
    title: "Conception d'un Système de Gestion de Stock",
    tasks: [
      Task(description: "Analyse des besoins des utilisateurs"),
      Task(description: "Conception de l'interface utilisateur"),
      Task(description: "Développement du backend"),
      Task(description: "Intégration des fonctionnalités de gestion"),
      Task(description: "Tests de sécurité"),
      Task(description: "Déploiement initial"),
      Task(description: "Formation des utilisateurs"),
      Task(description: "Support et maintenance"),
      Task(description: "Ajout de fonctionnalités supplémentaires"),
      Task(description: "Mise à jour régulière"),
      Task(description: "Documentation du système"),
      Task(description: "Évaluation des performances"),
    ],
  ),
];