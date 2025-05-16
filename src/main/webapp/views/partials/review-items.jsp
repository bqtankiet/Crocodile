<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="review" items="${productReviews}">
    <div class="border-bottom pb-4 mb-4">
        <div class="d-flex align-items-center mb-2">
            <img src="https://i1.sndcdn.com/artworks-ozhbsDOfLNl8quTs-ayDhHA-t240x240.jpg"
                 class="rounded-circle me-2" alt="avatar" style="width: 70px">
            <div class="user-info">
                <strong>
                    <c:choose>
                        <c:when test="${review.isShowUsername == 1}">
                            <strong>${review.username}</strong>
                        </c:when>
                        <c:otherwise>
                            Người dùng
                        </c:otherwise>
                    </c:choose>
                </strong>

                <div class="text-warning mb-2">
                    <c:forEach begin="1" end="5" var="i">
                        <c:choose>
                            <c:when test="${i <= review.rating}">
                                ★
                            </c:when>
                            <c:otherwise>
                                ☆
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="text-muted small">${review.createdAt}
                    <c:choose>
                        <c:when test="${not empty review.option1Value}">
                            | Phân loại hàng: ${review.option1Value}
                            <c:choose>
                                <c:when test="${not empty review.option2Value}">
                                    , ${review.option2Value}
                                </c:when>
                            </c:choose>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>

        <p class="mb-1"><strong>Chất lượng sản phẩm:</strong> <span class="text-success">${review.productQuality}</span></p>
        <p class="mb-1"><strong>Đúng với mô tả:</strong> <span class="text-success">${review.matchDescription}</span></p>
        <p>${review.reviewText}</p>

        <!-- Hình ảnh -->
        <div class="d-flex gap-2 mb-2">
            <c:if test="${not empty review.images}">
                <c:forEach var="img" items="${review.images}">
                    <img src="${img.imageUrl}" class="img-thumbnail" width="60" height="60">
                </c:forEach>
            </c:if>

        </div>


        <!-- Phản hồi của người bán -->
        <div class="bg-light p-3 rounded">
            <strong>Phản Hồi Của Người Bán</strong>
            <p class="mb-0">Cảm ơn bạn đã đánh giá sản phẩm. Shop hy vọng được phục vụ bạn trong lần mua tiếp theo!</p>
        </div>

        <c:if test="${review.sellerReply != null}">
            <div class="bg-light p-3 rounded">
                <strong>Phản Hồi Của Người Bán</strong>
                <p class="mb-0">${review.sellerReply}</p>
            </div>
        </c:if>

        <!-- Like -->
        <div class="mt-2 text-muted small">
            <button class="btn btn-sm btn-outline-success like-btn" data-review-id="${review.id}">
                👍
            </button>
            <span class="like-count">${review.likeCount}</span>
        </div>
    </div>
</c:forEach>
