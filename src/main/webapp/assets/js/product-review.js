
document.addEventListener("DOMContentLoaded", function () {
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

    document.querySelectorAll(".like-btn").forEach(button => {
        button.addEventListener("click", function () {
            const reviewId = this.dataset.reviewId;
            const likeCountSpan = this.nextElementSibling;

            fetch('/crocodile/like-review', {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: `reviewId=${reviewId}`
            })
                .then(response => response.text())
                .then(data => {
                    if (data === "success") {
                        let currentLikes = parseInt(likeCountSpan.textContent.trim());
                        likeCountSpan.textContent = currentLikes + 1;
                    } else {
                        alert("Lỗi khi Like. Vui lòng thử lại!");
                    }
                });
        });
    });

    document.querySelectorAll(".rating").forEach(button => {
        button.addEventListener("click", function () {
            const rating = this.dataset.rating;
            const idProduct = this.dataset.idproduct
            document.querySelectorAll('.rating').forEach(btn => btn.classList.remove('active'));

            button.classList.add('active');

            fetch(`/crocodile/rating-filter?idProduct=${idProduct}&rating=${rating}`)
                .then(response => response.text())
                .then(html => {
                    const content = html.trim();
                    document.getElementById("reviewList").innerHTML = content;
                });
        });
    });
});
