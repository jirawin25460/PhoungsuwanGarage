package com.springmvc.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "make")
public class Make {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int makeId;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @OneToMany(mappedBy = "make", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Car> cars;

    // Constructors
    public Make() {}

    public Make(String name) {
        this.name = name;
    }

    // Getters and Setters
    public int getMakeId() {
        return makeId;
    }

    public void setMakeId(int makeId) {
        this.makeId = makeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
