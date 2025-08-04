// cookie-banner.js

// Function to load the Google Analytics script
function loadGoogleAnalytics() {
  const gascript = document.createElement("script");
  gascript.async = true;
  gascript.src = "https://www.googletagmanager.com/gtag/js?id=G-DV6K7C0XDV"; // <-- Your GA ID
  document.head.appendChild(gascript);

  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-DV6K7C0XDV'); // <-- Your GA ID
  
  console.log("Google Analytics loaded after consent.");
}

document.addEventListener("DOMContentLoaded", function () {
  // If the user has already accepted, load GA immediately
  if (localStorage.getItem("cookieAccepted") === "true") {
    loadGoogleAnalytics();
    return; // Don't show the banner
  }

  // If the user has not accepted, show the banner
  const banner = document.createElement("div");
  banner.id = "cookie-banner";
  banner.innerHTML = `
    <p>
      This website uses cookies for analytics. By clicking "OK", you agree to its use.
      <button id="accept-cookies">OK</button>
      <a href="/privacy.html" class="cookie-link">(learn more)</a>
    </p>
  `;
  document.body.appendChild(banner);

  // When the user clicks "OK", set the preference and load GA
  document.getElementById("accept-cookies").addEventListener("click", function () {
    localStorage.setItem("cookieAccepted", "true");
    banner.remove();
    loadGoogleAnalytics();
  });
});