async function copyToClipboard(el) {
    let code = el.previousElementSibling.innerText;

    // Copy to clipboard
    await navigator.clipboard.writeText(code);

    // Change button text by using ::after pseudo element
    el.setAttribute("data-text", "Copied!");

    // Remove all text after 1 second
    setTimeout(() => {
        el.removeAttribute("data-text");
    }, 2000);
}
