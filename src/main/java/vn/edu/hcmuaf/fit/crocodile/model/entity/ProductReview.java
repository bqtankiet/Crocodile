package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class ProductReview implements Serializable {
    private int id;
    private int productId;
    private int userId;
    private int rating;
    private String reviewText;
    private String productQuality;
    private String matchDescription;
    private Timestamp createdAt;
    private int isShowUsername;
    private String sellerReply;
    private Timestamp replyTime;
    private int likeCount;
    private List<ReviewImage> images;

    public ProductReview() { }

    @Override
    public String toString() {
        return "ProductReview{" +
                "id=" + id +
                ", productId=" + productId +
                ", userId=" + userId +
                ", rating=" + rating +
                ", reviewText='" + reviewText + '\'' +
                ", productQuality='" + productQuality + '\'' +
                ", matchDescription='" + matchDescription + '\'' +
                ", createdAt=" + createdAt +
                ", isShowUsername=" + isShowUsername +
                ", sellerReply='" + sellerReply + '\'' +
                ", replyTime=" + replyTime +
                ", likeCount=" + likeCount +
                ", images=" + images +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getProductQuality() {
        return productQuality;
    }

    public void setProductQuality(String productQuality) {
        this.productQuality = productQuality;
    }

    public String getMatchDescription() {
        return matchDescription;
    }

    public void setMatchDescription(String matchDescription) {
        this.matchDescription = matchDescription;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public int getIsShowUsername() {
        return isShowUsername;
    }

    public void setIsShowUsername(int isShowUsername) {
        this.isShowUsername = isShowUsername;
    }

    public String getSellerReply() {
        return sellerReply;
    }

    public void setSellerReply(String sellerReply) {
        this.sellerReply = sellerReply;
    }

    public Timestamp getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Timestamp replyTime) {
        this.replyTime = replyTime;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public List<ReviewImage> getImages() {
        return images;
    }

    public void setImages(List<ReviewImage> images) {
        this.images = images;
    }

    public static class ReviewImage implements Serializable {
        private int id;
        private int reviewId;
        private String imageUrl;
    }
}
