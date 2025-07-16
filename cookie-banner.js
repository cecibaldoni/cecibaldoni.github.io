// cookie-banner.js

document.addEventListener("DOMContentLoaded", function () {
  if (!localStorage.getItem("cookieAccepted")) {
    const banner = document.createElement("div");
    banner.id = "cookie-banner";
    banner.innerHTML = `
      <p>
        This website uses Google Analytics to improve its functionality. 
        <button id="accept-cookies">OK</button>
        <a href="/privacy" class="cookie-link">(learn more)</a>
      </p>
    `;
    document.body.appendChild(banner);

    document.getElementById("accept-cookies").addEventListener("click", function () {
      localStorage.setItem("cookieAccepted", "true");
      banner.remove();
    });
  }
});
