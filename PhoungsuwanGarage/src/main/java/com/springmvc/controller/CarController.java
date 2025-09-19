package com.springmvc.controller;

import com.springmvc.model.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CarController {

    private final CarManager carManager = new CarManager(); // reuse instance

    // แสดงรายการรถ
    @GetMapping("/listcar")
    public ModelAndView listCars(HttpSession session) {
        List<Car> carList = carManager.getAllCar();
        List<Make> makes = carManager.getAllMakes();
        session.setAttribute("carList", carList);

        ModelAndView mav = new ModelAndView("model");
        mav.addObject("carList", carList);
        mav.addObject("makes", makes);
        return mav;
    }

    // แสดงหน้าเลือกรถ
    @GetMapping("/selectcar")
    public ModelAndView selectCar(HttpSession session) {
        List<Car> carList = (List<Car>) session.getAttribute("carList");
        if (carList == null) {
            carList = carManager.getAllCar();
            session.setAttribute("carList", carList);
        }

        List<Make> makeList = (List<Make>) session.getAttribute("makeList");
        if (makeList == null) {
            makeList = carManager.getAllMakes();
            session.setAttribute("makeList", makeList);
        }

        ModelAndView mav = new ModelAndView("selectcar");
        mav.addObject("carList", carList);
        mav.addObject("makeList", makeList);
        return mav;
    }

    // แสดงรายละเอียดรถ
    @GetMapping("/detail")
    public ModelAndView carDetail(@RequestParam("carId") Integer carId, HttpSession session) {
        Car car = carManager.getCarById(carId);
        if (car == null) return new ModelAndView("error", "message", "ไม่พบรถที่เลือก");

        session.setAttribute("car", car);
        List<Make> makeList = (List<Make>) session.getAttribute("makeList");
        if (makeList == null) {
            makeList = carManager.getAllMakes();
            session.setAttribute("makeList", makeList);
        }

        ModelAndView mav = new ModelAndView("detail");
        mav.addObject("car", car);
        mav.addObject("make", car.getMake());
        return mav;
    }

    // แสดงฟอร์มสั่งซื้อ
    @GetMapping("/orderForm")
    public ModelAndView orderForm(@RequestParam("carId") Integer carId, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("user");
        Car selectedCar = carManager.getCarById(carId);

        if (selectedCar == null || customer == null)
            return new ModelAndView("error", "message", "ไม่พบข้อมูลรถหรือข้อมูลลูกค้า");

        session.setAttribute("car", selectedCar);
        ModelAndView mav = new ModelAndView("order");
        mav.addObject("car", selectedCar);
        mav.addObject("customer", customer);
        mav.addObject("order", new Order());
        return mav;
    }

    // บันทึกคำสั่งซื้อ
    @PostMapping("/saveOrder")
    public ModelAndView saveOrder(@ModelAttribute Order order, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("user");
        Car selectedCar = (Car) session.getAttribute("car");

        if (customer == null || selectedCar == null)
            return new ModelAndView("error", "message", "ไม่พบข้อมูลลูกค้าหรือรถที่เลือก");

        order.setCustomer(customer);
        order.setCar(selectedCar);

        boolean isInserted = carManager.insertOrder(order);
        if (isInserted) {
            ModelAndView mav = new ModelAndView("bill");
            mav.addObject("order", order);
            mav.addObject("message", "บันทึกคำสั่งซื้อสำเร็จ!");
            return mav;
        } else {
            return new ModelAndView("error", "message", "ไม่สามารถบันทึกคำสั่งซื้อได้");
        }
    }

    // แสดงฟอร์มแก้ไขรถ
    @GetMapping("/editCar")
    public ModelAndView editCarForm(@RequestParam("carId") Integer carId, HttpSession session) {
        Car car = carManager.getCarById(carId);
        if (car == null) return new ModelAndView("error", "message", "ไม่พบรถที่เลือก");

        session.setAttribute("selectedCar", car);

        ModelAndView mav = new ModelAndView("editcar");
        mav.addObject("car", car);
        mav.addObject("makes", carManager.getAllMakes());
        mav.addObject("promotions", carManager.getAllPromotions());
        return mav;
    }

    // อัปเดทรถ
    @PostMapping("/updateCar")
    public ModelAndView updateCar(@ModelAttribute Car car, HttpSession session) {
        Car sessionCar = (Car) session.getAttribute("selectedCar");
        if (sessionCar == null) return new ModelAndView("error", "message", "ไม่พบรถที่เลือก");

        sessionCar.setModel(car.getModel());
        sessionCar.setYear(car.getYear());
        sessionCar.setPrice(car.getPrice());
        sessionCar.setDetails(car.getDetails());
        sessionCar.setImageUrl(car.getImageUrl());
        sessionCar.setMake(car.getMake());
        sessionCar.setPromotion(car.getPromotion());

        boolean isUpdated = carManager.updateCar(sessionCar);
        if (isUpdated) {
            session.setAttribute("selectedCar", sessionCar);
            ModelAndView mav = new ModelAndView("index");
            mav.addObject("message", "แก้ไขข้อมูลรถเรียบร้อยแล้ว");
            return mav;
        } else {
            return new ModelAndView("error", "message", "ไม่สามารถแก้ไขข้อมูลรถได้");
        }
    }

    // ฟอร์มเพิ่มรถ
    @GetMapping("/addCar")
    public ModelAndView addCarForm() {
        ModelAndView mav = new ModelAndView("addcar");
        mav.addObject("makes", carManager.getAllMakes());
        mav.addObject("promotions", carManager.getAllPromotions());
        return mav;
    }

    // บันทึกรถใหม่
    @PostMapping("/saveCar")
    public ModelAndView saveCar(@RequestParam("makeId") Integer makeId,
                                @RequestParam(value = "promotionId", required = false) Integer promotionId,
                                @RequestParam("model") String model,
                                @RequestParam("year") Integer year,
                                @RequestParam("price") Double price,
                                @RequestParam("details") String details,
                                @RequestParam("imageUrl") String imageUrl) {

        Make make = carManager.getMakeById(makeId);
        Promotion promotion = (promotionId != null) ? carManager.getPromotionById(promotionId) : null;

        Car car = new Car(make, model, year, price, details, imageUrl, promotion);
        boolean isInserted = carManager.insertCar(car);

        ModelAndView mav = new ModelAndView("index");
        mav.addObject("message", isInserted ? "เพิ่มรถใหม่สำเร็จ" : "ไม่สามารถเพิ่มรถได้");
        return mav;
    }

    // ลบรถ
    @GetMapping("/deleteCar")
    public ModelAndView deleteCar(@RequestParam("carId") Integer carId) {
        boolean isDeleted = carManager.deleteCar(carId);
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("message", isDeleted ? "ข้อมูลรถถูกลบเรียบร้อยแล้ว" : "ไม่สามารถลบข้อมูลรถได้");
        return mav;
    }

    // กรองรถตาม Make
    @GetMapping("/filterCarsByMake")
    public ModelAndView filterByMake(@RequestParam(required = false) Integer makeId) {
        List<Car> carList = (makeId != null) ? carManager.getCarsByMake(makeId) : carManager.getAllCar();
        ModelAndView mav = new ModelAndView("model");
        mav.addObject("carList", carList);
        mav.addObject("makes", carManager.getAllMakes());
        mav.addObject("selectedMakeId", makeId);
        return mav;
    }

    // ค้นหารถ
    @PostMapping("/searchCar")
    public ModelAndView searchCar(@RequestParam("keyword") String keyword) {
        List<Car> carList = carManager.searchCarsByKeyword(keyword);
        ModelAndView mav = new ModelAndView("model");
        mav.addObject("carList", carList);
        mav.addObject("keyword", keyword);
        mav.addObject("makes", carManager.getAllMakes());
        return mav;
    }
}
