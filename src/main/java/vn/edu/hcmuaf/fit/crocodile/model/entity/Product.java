package vn.edu.hcmuaf.fit.crocodile.model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Product implements Serializable {

    private int id;
    private String name;
    private String image;
    private int price;
    private String description;
    private Date createDate;
    private Category category;
    private boolean active;

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", createDate=" + createDate +
                ", category=" + category +
                ", active=" + active +
                '}';
    }

    // getter, setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public static class ProductImage implements Serializable {

        private int id;
        private int idProduct;
        private int index;
        private String image;

        @Override
        public String toString() {
            return "ProductImage{" +
                    "id=" + id +
                    ", idProduct=" + idProduct +
                    ", image='" + image + '\'' +
                    '}';
        }

        // getter, setter
        public int getIndex() {
            return index;
        }

        public void setIndex(int imageIndex) {
            this.index = imageIndex;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getIdProduct() {
            return idProduct;
        }

        public void setIdProduct(int idProduct) {
            this.idProduct = idProduct;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }
    }

    public static class ProductDetail implements Serializable {
        private int id;
        private String key;
        private String value;

        @Override
        public String toString() {
            return "ProductDetail{" +
                    "id=" + id +
                    ", key='" + key + '\'' +
                    ", value='" + value + '\'' +
                    '}';
        }

        // getter, setter
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getKey() {
            return key;
        }

        public void setKey(String key) {
            this.key = key;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }

    public static class ProductOption implements Serializable {
        private int id;
        private int group;
        private String key;
        private String value;
        private String idImage;
        private String image;
        private int imageIndex;

        @Override
        public String toString() {
            return "ProductOption{" +
                    "id=" + id +
                    ", group=" + group +
                    ", key='" + key + '\'' +
                    ", value='" + value + '\'' +
                    ", idImage='" + idImage + '\'' +
                    ", image='" + image + '\'' +
                    '}';
        }

        // getter, setter

        public int getImageIndex() {
            return imageIndex;
        }

        public void setImageIndex(int imageIndex) {
            this.imageIndex = imageIndex;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getGroup() {
            return group;
        }

        public void setGroup(int group) {
            this.group = group;
        }

        public String getKey() {
            return key;
        }

        public void setKey(String key) {
            this.key = key;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        public String getIdImage() {
            return idImage;
        }

        public void setIdImage(String idImage) {
            this.idImage = idImage;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }
    }

    public static class ProductOptionGroup implements Serializable {
        private int groupNo;
        private String groupName;
        private List<ProductOption> options;

        @Override
        public String toString() {
            return "ProductOptionGroup{" +
                    "groupNo=" + groupNo +
                    ", groupName='" + groupName + '\'' +
                    ", options=" + options +
                    '}';
        }

        // getter, setter
        public int getGroupNo() {
            return groupNo;
        }

        public void setGroupNo(int groupNo) {
            this.groupNo = groupNo;
        }

        public String getGroupName() {
            return groupName;
        }

        public void setGroupName(String groupName) {
            this.groupName = groupName;
        }

        public List<ProductOption> getOptions() {
            return options;
        }

        public void setOptions(List<ProductOption> options) {
            this.options = options;
        }
    }

    public static class ProductVariant implements Serializable {
        private int id;
        private int idProduct;
        private String sku;
        private int idOption1;
        private int idOption2;
        private int stock;
//<<<<<<< HEAD
//        private ProductOption option1;
//        private ProductOption option2;
//=======
        private Product product;
        private ProductOption pOption1;
        private ProductOption pOption2;
//>>>>>>> develop

        @Override
        public String toString() {
            return "ProductVariant{" +
                    "id=" + id +
                    ", idProduct=" + idProduct +
                    ", sku='" + sku + '\'' +
                    ", idOption1=" + idOption1 +
                    ", idOption2=" + idOption2 +
                    ", stock=" + stock +
                    '}';
        }

        // getter, setter

//<<<<<<< HEAD
//        public ProductOption getOption1() {
//            return option1;
//        }
//
//        public void setOption1(ProductOption option1) {
//            this.option1 = option1;
//        }
//
//        public ProductOption getOption2() {
//            return option2;
//        }
//
//        public void setOption2(ProductOption option2) {
//            this.option2 = option2;
//=======
        public ProductOption getpOption2() {
            return pOption2;
        }

        public void setpOption2(ProductOption pOption2) {
            this.pOption2 = pOption2;
        }

        public ProductOption getpOption1() {
            return pOption1;
        }

        public void setpOption1(ProductOption pOption1) {
            this.pOption1 = pOption1;
        }

        public Product getProduct() { return product; }

        public void setProduct(Product product) {
            this.product = product;
//>>>>>>> develop
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getIdProduct() {
            return idProduct;
        }

        public void setIdProduct(int idProduct) {
            this.idProduct = idProduct;
        }

        public String getSku() {
            return sku;
        }

        public void setSku(String sku) {
            this.sku = sku;
        }

        public int getIdOption1() {
            return idOption1;
        }

        public void setIdOption1(int idOption1) {
            this.idOption1 = idOption1;
        }

        public int getIdOption2() {
            return idOption2;
        }

        public void setIdOption2(int idOption2) {
            this.idOption2 = idOption2;
        }

        public int getStock() {
            return stock;
        }

        public void setStock(int stock) {
            this.stock = stock;
        }
    }

    public static class ProductAttribute implements Serializable{
        private int id;
        private int idProduct;
        private String key;
        private String value;

        // constructors
        public ProductAttribute() {
        }

        public ProductAttribute(int id, int idProduct, String key, String value) {
            this.id = id;
            this.idProduct = idProduct;
            this.key = key;
            this.value = value;
        }

        // methods
        @Override
        public String toString() {
            return "ProductAttribute{" +
                    "id=" + id +
                    ", idProduct=" + idProduct +
                    ", key='" + key + '\'' +
                    ", value='" + value + '\'' +
                    '}';
        }

        // getter, setter
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getIdProduct() {
            return idProduct;
        }

        public void setIdProduct(int idProduct) {
            this.idProduct = idProduct;
        }

        public String getKey() {
            return key;
        }

        public void setKey(String key) {
            this.key = key;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }
}
