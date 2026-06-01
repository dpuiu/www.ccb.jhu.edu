document.addEventListener("DOMContentLoaded", function () {
    if (window.location.search.includes("highlight=")) {
        let marks = document.querySelectorAll("mark");
        marks.forEach(m => {
            m.style.background = "#ffeb3b";
            m.style.color = "black";
        });
    }
});
