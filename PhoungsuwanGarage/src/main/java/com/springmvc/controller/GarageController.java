package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Car;
import com.springmvc.model.CarManager;
import com.springmvc.model.Customer;
import com.springmvc.model.GarageManager;
import com.springmvc.model.Make;
import com.springmvc.model.Promotion;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class GarageController {

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView loadIndexPage() {
        CarManager cm = new CarManager();
        List<Car> carList = cm.getAllCar();
        List<Make> makes = cm.getAllMakes();
        List<Promotion> promotions = cm.getAllPromotions();

        ModelAndView mav = new ModelAndView("index");
        mav.addObject("carList", carList);
        mav.addObject("makes", makes);
        mav.addObject("promotions", promotions);
        return mav;
    }

    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String loadLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactPage() {
        return "contact";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView loadProfilePage(HttpSession session) {
        Customer user = (Customer) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("login", "message", "กรุณาเข้าสู่ระบบก่อนเข้าดูข้อมูลโปรไฟล์");
        } else {
            ModelAndView mav = new ModelAndView("profile");
            mav.addObject("user", user);
            return mav;
        }
    }

    @RequestMapping(value = "/promotion", method = RequestMethod.GET)
    public ModelAndView promotionPage() {
        CarManager cm = new CarManager();
        List<Promotion> promotions = cm.getAllPromotions();
        ModelAndView mav = new ModelAndView("promotion");
        mav.addObject("promotions", promotions);
        return mav;
    }

    @RequestMapping(value = "/make", method = RequestMethod.GET)
    public ModelAndView makePage() {
        CarManager cm = new CarManager();
        List<Make> makes = cm.getAllMakes();
        ModelAndView mav = new ModelAndView("make");
        mav.addObject("makes", makes);
        return mav;
    }

    @RequestMapping(value = "/cust", method = RequestMethod.GET)
    public String custPage() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView registerCustomer(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String pic = request.getParameter("pic");

        try {
            password = PasswordUtil.getInstance().createPassword(password, "itmjusci");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        Customer customer = new Customer(email, name, phone, password, pic);
        GarageManager gm = new GarageManager();
        boolean isInserted = gm.InsertCustomer(customer);

        ModelAndView mav = new ModelAndView("login");
        if (isInserted) {
            mav.addObject("message", "Registration successful!");
        } else {
            mav.addObject("message", "Registration failed.");
        }
        return mav;
    }

    @RequestMapping(value = "/processLogin", method = RequestMethod.POST)
    public ModelAndView processLogin(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            password = PasswordUtil.getInstance().createPassword(password, "itmjusci");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        GarageManager gm = new GarageManager();
        Customer user = gm.validateUser(email, password);

        ModelAndView mav = new ModelAndView();
        if (user != null) {
            session.setAttribute("user", user);
            mav.setViewName("index");
            mav.addObject("message", "Login successful!");
        } else {
            mav.setViewName("login");
            mav.addObject("message", "Invalid email or password.");
        }
        return mav;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "index";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public ModelAndView editProfile(HttpSession session) {
        Customer user = (Customer) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("login", "message", "กรุณาลงชื่อเข้าใช้ก่อนทำการแก้ไขโปรไฟล์.");
        }
        ModelAndView mav = new ModelAndView("editProfile");
        mav.addObject("user", user);
        return mav;
    }

    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(HttpServletRequest request, HttpSession session) {
        Customer user = (Customer) session.getAttribute("user");
        if (user == null) {
            return new ModelAndView("login", "message", "Session expired. Please log in again.");
        }

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String pic = request.getParameter("pic");

        if (email != null && !email.trim().isEmpty()) user.setEmail(email);
        if (name != null && !name.trim().isEmpty()) user.setName(name);
        if (phone != null && !phone.trim().isEmpty()) user.setPhone(phone);
        if (password != null && !password.trim().isEmpty()) {
            try {
                user.setPassword(PasswordUtil.getInstance().createPassword(password, "itmjusci"));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        if (pic != null && !pic.trim().isEmpty()) user.setPic(pic);

        GarageManager gm = new GarageManager();
        boolean isUpdated = gm.updateCustomer(user);

        if (!isUpdated) {
            return new ModelAndView("editProfile", "error", "การอัปเดตโปรไฟล์ไม่สำเร็จ. โปรดลองอีกครั้ง.");
        }

        session.setAttribute("user", user);
        ModelAndView mav = new ModelAndView("profile");
        mav.addObject("user", user);
        mav.addObject("message1", "อัปเดตโปรไฟล์เรียบร้อยแล้ว!");
        return mav;
    }
}
