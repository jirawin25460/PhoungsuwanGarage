package com.springmvc.model;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "promotion")
public class Promotion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int promotionId;

    @Column(name = "promotion_name")
    private String promotionName;

    @Column(name = "description" , length = 1000)
    private String description;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "end_date")
    private String endDate;

    @OneToMany(mappedBy = "promotion", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Car> cars;

    public Promotion() {}

    public Promotion(String promotionName, String description, String imageUrl, String startDate, String endDate) {
        this.promotionName = promotionName;
        this.description = description;
        this.imageUrl = imageUrl;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters and Setters
    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getPromotionName() {
        return promotionName;
    }

    public void setPromotionName(String promotionName) {
        this.promotionName = promotionName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDateStr) {
        this.startDate = startDateStr;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDateStr) {
        this.endDate = endDateStr;
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
