const loadMoreBtn = document.getElementById("loadMoreBtn")
let offset = 5;
let idProduct = loadMoreBtn.dataset.idproduct;

loadMoreBtn.addEventListener("click", function () {
    const url = `/crocodile/more-review?idProduct=${idProduct}&offset=${offset}`;

    fetch(url)
        .then(response => response.text())
        .then(html => {
            const content = html.trim();
            if (content === "") {
                loadMoreBtn.style.display = "none";
            } else {
                document.getElementById("reviewList").insertAdjacentHTML("beforeend", content);
                offset += 5;
            }
        });
});