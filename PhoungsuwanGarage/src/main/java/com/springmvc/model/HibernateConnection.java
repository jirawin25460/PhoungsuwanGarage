package com.springmvc.model;

import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateConnection {

    private static SessionFactory sessionFactory;
    private static final String URL = "jdbc:mysql://localhost:3306/garage?characterEncoding=UTF-8&serverTimezone=Asia/Bangkok";
    private static final String USER = "root";
    private static final String PASS = "1234";

    public static SessionFactory doHibernateConnection() {
        if (sessionFactory != null && !sessionFactory.isClosed()) {
            return sessionFactory;
        }

        try {
            Properties props = new Properties();
            props.setProperty("hibernate.connection.driver_class", "com.mysql.cj.jdbc.Driver");
            props.setProperty("hibernate.connection.url", URL);
            props.setProperty("hibernate.connection.username", USER);
            props.setProperty("hibernate.connection.password", PASS);
            props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL8Dialect");
            props.setProperty("hibernate.hbm2ddl.auto", "update"); // สำหรับ dev เท่านั้น
            props.setProperty("hibernate.show_sql", "true");
            props.setProperty("hibernate.format_sql", "true");
            props.setProperty("hibernate.current_session_context_class", "thread");

            Configuration cfg = new Configuration()
                    .setProperties(props)
                    .addAnnotatedClass(Customer.class)
                    .addAnnotatedClass(Order.class)
                    .addAnnotatedClass(Make.class)
                    .addAnnotatedClass(Promotion.class)
                    .addAnnotatedClass(Car.class);

            StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder()
                    .applySettings(cfg.getProperties());

            sessionFactory = cfg.buildSessionFactory(ssrb.build());
            return sessionFactory;

        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException("Failed to create Hibernate SessionFactory", ex);
        }
    }
}
