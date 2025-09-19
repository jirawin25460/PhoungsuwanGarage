package com.springmvc.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.springmvc.model.CarManager;
import com.springmvc.model.Promotion;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PromotionController {

    // แสดงฟอร์มเพิ่มโปรโมชั่น
    @RequestMapping(value = "/addPromotion", method = RequestMethod.GET)
    public ModelAndView showAddPromotionForm() {
        return new ModelAndView("addpromotion");
    }

    // แสดงรายการโปรโมชั่น
    @RequestMapping(value = "/listPromotion", method = RequestMethod.GET)
    public ModelAndView loadPromotionList(HttpSession session) {
        CarManager cm = new CarManager();
        List<Promotion> promotions = cm.getAllPromotions();
        session.setAttribute("promotions", promotions);

        ModelAndView mav = new ModelAndView("promotion");
        mav.addObject("promotions", promotions);
        return mav;
    }

    // แสดงรายละเอียดโปรโมชั่น
    @RequestMapping(value = "/detailPromotion", method = RequestMethod.GET)
    public ModelAndView showPromotionDetail(@RequestParam("promotionId") int promotionId) {
        CarManager cm = new CarManager();
        Promotion promotion = cm.getPromotionById(promotionId);

        if (promotion == null) {
            return new ModelAndView("error", "message", "ไม่พบโปรโมชั่นที่เลือก");
        }

        ModelAndView mav = new ModelAndView("detailpromotion");
        mav.addObject("promotion", promotion);
        return mav;
    }

    // เพิ่มโปรโมชั่นใหม่
    @RequestMapping(value = "/addPromotion", method = RequestMethod.POST)
    public ModelAndView addPromotion(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index");

        try {
            String promotionName = request.getParameter("promotionName");
            String description = request.getParameter("description");
            String imageUrl = request.getParameter("imageUrl");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");

            Promotion promotion = new Promotion();
            promotion.setPromotionName(promotionName);
            promotion.setDescription(description);
            promotion.setImageUrl(imageUrl);
            promotion.setStartDate(startDateStr);
            promotion.setEndDate(endDateStr);

            CarManager cm = new CarManager();
            boolean isInserted = cm.insertPromotion(promotion);

            mav.addObject("message", isInserted ? "เพิ่มโปรโมชั่นสำเร็จแล้ว" : "ไม่สามารถเพิ่มโปรโมชั่นได้ กรุณาลองใหม่อีกครั้ง");

        } catch (Exception e) {
            mav.setViewName("error");
            mav.addObject("message", "เกิดข้อผิดพลาด: " + e.getMessage());
        }

        return mav;
    }

    // แสดงฟอร์มแก้ไขโปรโมชั่น
    @RequestMapping(value = "/editPromotion", method = RequestMethod.GET)
    public ModelAndView showEditPromotionForm(@RequestParam("promotionId") int promotionId) {
        CarManager cm = new CarManager();
        Promotion promotion = cm.getPromotionById(promotionId);

        ModelAndView mav = new ModelAndView("editpromotion");
        if (promotion != null) {
            mav.addObject("promotion", promotion);
        } else {
            mav.setViewName("error");
            mav.addObject("message", "ไม่พบโปรโมชั่นที่ต้องการแก้ไข");
        }
        return mav;
    }

    // บันทึกข้อมูลโปรโมชั่นที่แก้ไข
    @RequestMapping(value = "/updatePromotion", method = RequestMethod.POST)
    public ModelAndView updatePromotion(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("index");

        try {
            int promotionId = Integer.parseInt(request.getParameter("promotionId"));
            CarManager cm = new CarManager();
            Promotion promotion = cm.getPromotionById(promotionId);

            if (promotion != null) {
                promotion.setPromotionName(request.getParameter("promotionName"));
                promotion.setDescription(request.getParameter("description"));
                promotion.setImageUrl(request.getParameter("imageUrl"));
                promotion.setStartDate(request.getParameter("startDate"));
                promotion.setEndDate(request.getParameter("endDate"));

                boolean isUpdated = cm.updatePromotion(promotion);
                mav.addObject("message", isUpdated ? "แก้ไขโปรโมชั่นสำเร็จแล้ว" : "ไม่สามารถแก้ไขโปรโมชั่นได้ กรุณาลองใหม่อีกครั้ง");
            } else {
                mav.setViewName("error");
                mav.addObject("message", "ไม่พบโปรโมชั่นที่ต้องการแก้ไข");
            }

        } catch (Exception e) {
            mav.setViewName("error");
            mav.addObject("message", "เกิดข้อผิดพลาด: " + e.getMessage());
        }

        return mav;
    }

    // ลบโปรโมชั่น
    @RequestMapping(value = "/deletePromotion", method = RequestMethod.GET)
    public ModelAndView deletePromotion(@RequestParam("promotionId") int promotionId) {
        CarManager cm = new CarManager();
        boolean isDeleted = cm.deletePromotion(promotionId);

        ModelAndView mav = new ModelAndView("promotion");
        mav.addObject("message", isDeleted ? "โปรโมชั่นถูกลบเรียบร้อยแล้ว" : "ไม่สามารถลบโปรโมชั่นได้ กรุณาลองใหม่อีกครั้ง");
        mav.addObject("promotions", cm.getAllPromotions());
        return mav;
    }
}
