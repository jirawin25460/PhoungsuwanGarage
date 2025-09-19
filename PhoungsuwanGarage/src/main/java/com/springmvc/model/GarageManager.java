package com.springmvc.model;

import java.util.List;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class GarageManager {

    public List<Customer> getRegister() {
        List<Customer> list = new ArrayList<>();
        try {
            SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            list = session.createQuery("From Customer",Customer.class).list();
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }



    public boolean InsertCustomer(Customer c) {
        try {
            SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.saveOrUpdate(c);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Customer validateUser(String email, String password) {
        Customer user = null;
        try {
            SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            String hql = "FROM Customer WHERE email = :email AND password = :password";
            user = session.createQuery(hql, Customer.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .uniqueResult();
            session.getTransaction().commit();
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return user;
    }



    public Customer getCustomerByEmail(String email) {
        try {
            SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            Customer cust = session.get(Customer.class, email);
            session.getTransaction().commit();
            session.close();
            return cust;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Car> searchCars(String keyword) {
        List<Car> list = new ArrayList<>();
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            session.beginTransaction();
            list = session.createQuery("FROM Car WHERE model LIKE :keyword", Car.class)
                    .setParameter("keyword", "%" + keyword + "%")
                    .list();
            session.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public boolean updateCustomer(Customer c) {
        try {
            SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
            Session session = sessionFactory.openSession();
            session.beginTransaction();
            session.update(c); // Update the user record
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    
    
    
    


}

