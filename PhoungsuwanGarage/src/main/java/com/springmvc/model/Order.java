package com.springmvc.model;

import jakarta.persistence.*;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY) // ใช้ MERGE แทน ALL
    @JoinColumn(name = "email", referencedColumnName = "email", nullable = false)
    private Customer customer;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY) // ใช้ MERGE แทน ALL
    @JoinColumn(name = "carId", referencedColumnName = "carId", nullable = false)
    private Car car;

    @Column(name = "order_date")
    private String orderDate;

    @Column(name = "colorcar")
    private String colorcar;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "end_date")
    private String endDate;

    // Default constructor
    public Order() {
        this.orderDate = java.time.LocalDate.now().toString(); // ตั้งค่าวันที่ปัจจุบันในรูปแบบ ISO
    }

    // Constructor with parameters
    public Order(Customer customer, Car car, String colorcar, String startDate, String endDate) {
        super();
        this.customer = customer;
        this.car = car;
        this.orderDate = java.time.LocalDate.now().toString(); // วันที่ปัจจุบันในรูปแบบ ISO
        this.colorcar = colorcar;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getColorcar() {
        return colorcar;
    }

    public void setColorcar(String colorcar) {
        this.colorcar = colorcar;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
