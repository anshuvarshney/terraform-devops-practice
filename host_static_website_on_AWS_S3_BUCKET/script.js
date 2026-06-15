// Mobile Menu Toggle
const menuBtn = document.getElementById("menuBtn");
const navLinks = document.getElementById("navLinks");

menuBtn.addEventListener("click", () => {
    navLinks.classList.toggle("active");
});

// Learn More Button
document.getElementById("learnMoreBtn").addEventListener("click", () => {
    document.getElementById("services").scrollIntoView({
        behavior: "smooth"
    });
});

// Contact Form
document.getElementById("contactForm").addEventListener("submit", (e) => {
    e.preventDefault();

    alert("Thank you! Your message has been submitted.");

    e.target.reset();
});