<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion - AFRICA PHONE</title>
  <!-- Lucide Icons -->
  <script src="https://unpkg.com/lucide@latest"></script>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #006064;
      --secondary-color: #004d40;
      --accent-color: #ff6f00;
      --bg-color: #f5f7fa;
      --white: #ffffff;
      --text-color: #333;
      --border-radius: 12px;
      --shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: 'Roboto', sans-serif;
      background: var(--bg-color);
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    .login-container {
      background: var(--white);
      padding: 30px 20px;
      border-radius: var(--border-radius);
      box-shadow: var(--shadow);
      width: 90%;
      max-width: 400px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .login-container h1 {
      color: var(--primary-color);
      font-size: 22px;
      margin-bottom: 10px;
    }
    .login-container p {
      color: var(--text-color);
      margin-bottom: 20px;
      font-size: 14px;
    }
    .input-group {
      position: relative;
      margin-bottom: 15px;
    }
    /* Style pour le select */
    .input-group select {
      width: 100%;
      padding: 14px;
      border: 1px solid #ccc;
      border-radius: var(--border-radius);
      font-size: 16px;
      outline: none;
      appearance: none;
      background-image: url('data:image/svg+xml;charset=US-ASCII,<svg%20xmlns="http://www.w3.org/2000/svg"%20width="24"%20height="24"%20viewBox="0%200%2024%2024"><path%20fill="%23006064"%20d="M7 10l5 5 5-5z"/></svg>');
      background-repeat: no-repeat;
      background-position: right 10px center;
      background-size: 24px;
    }
    .input-group input {
      width: 100%;
      padding: 14px 45px 14px 14px;
      border: 1px solid #ccc;
      border-radius: var(--border-radius);
      font-size: 16px;
      outline: none;
    }
    .input-group .icon {
      position: absolute;
      right: 14px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 20px;
      color: var(--primary-color);
    }
    .btn-login {
      width: 100%;
      padding: 14px;
      font-size: 18px;
      font-weight: bold;
      background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
      color: var(--white);
      border: none;
      border-radius: var(--border-radius);
      cursor: pointer;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .btn-login:active {
      transform: scale(0.98);
    }
    .error-message {
      color: red;
      font-size: 14px;
      margin-top: 10px;
      display: none;
    }
  </style>
  <!-- Firebase SDK -->
  <script src="https://www.gstatic.com/firebasejs/9.17.2/firebase-app-compat.js"></script>
  <script src="https://www.gstatic.com/firebasejs/9.17.2/firebase-auth-compat.js"></script>
</head>
<body>

<div class="login-container">
  <h1>🔐 AFRICA PHONE</h1>
  <p>Accès réservé aux employés autorisés</p>
  
  <form id="loginForm">
    <!-- Sélection du type de compte -->
    <div class="input-group">
      <select id="role" required>
        <option value="admin">Admin</option>
        <option value="employe">Employé</option>
      </select>
    </div>
    <!-- Champ mot de passe -->
    <div class="input-group">
      <input type="password" id="password" placeholder="Mot de passe" required>
      <span class="icon"><i data-lucide="lock"></i></span>
    </div>
    <button type="submit" class="btn-login">Se Connecter</button>
    <p class="error-message" id="errorMessage">Mot de passe incorrect !</p>
  </form>
</div>

<script>
  // --- Configuration Firebase (remplace ces valeurs par les tiennes si nécessaire) ---
  const firebaseConfig = {
    apiKey: "AIzaSyB44wUN_WitWSIjoUKtWXI6z6SuQx41_fg",
    authDomain: "africaphone1-accfb.firebaseapp.com",
    projectId: "africaphone1-accfb",
    storageBucket: "africaphone1-accfb.firebasestorage.app",
    messagingSenderId: "747416222232",
    appId: "1:747416222232:web:36cb8a93f3c8342ad3e16d",
    measurementId: "G-LFT6C3Q9D9"
  };

  // Initialiser Firebase
  firebase.initializeApp(firebaseConfig);
  const auth = firebase.auth();

  // --- Comptes de l'entreprise ---
  const EMAILS = {
    admin: "admin@africaphone.com",
    employe: "employe@africaphone.com"
  };

  document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const role = document.getElementById('role').value;
    const email = EMAILS[role];
    const password = document.getElementById('password').value;

    auth.signInWithEmailAndPassword(email, password)
      .then(() => {
        // Connexion réussie, rediriger vers index.html
        window.location.href = 'index.html';
      })
      .catch((error) => {
        document.getElementById('errorMessage').style.display = 'block';
        console.error("Erreur de connexion :", error);
      });
  });

  window.addEventListener('load', () => {
    lucide.createIcons();
  });
</script>

</body>
</html>
