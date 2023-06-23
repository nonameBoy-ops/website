// JavaScript für Dark/White Mode
const toggleButton = document.createElement('button');
toggleButton.textContent = 'White Mode';
toggleButton.style.position = 'fixed';
toggleButton.style.top = '10px';
toggleButton.style.right = '10px';
toggleButton.addEventListener('click', toggleDarkMode);

document.getElementById("DarkWhite").onclick = toggleDarkMode;

function toggleDarkMode() {
    toggleButton.textContent === 'White Mode'
    document.body.classList.toggle('dark-mode');
    document.querySelector('.navbar').classList.toggle('dark-mode');
    document.querySelector('.content').classList.toggle('dark-mode');

    if (toggleButton.textContent === 'White Mode') {
        toggleButton.textContent = 'Dark Mode';
    } else {
        toggleButton.textContent = 'White Mode';
    }
}