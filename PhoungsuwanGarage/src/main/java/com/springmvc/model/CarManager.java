package com.springmvc.model;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CarManager {

    public boolean insertOrder(Order order) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(order);
            tx.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<Car> getAllCar() {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery("FROM Car c LEFT JOIN FETCH c.make LEFT JOIN FETCH c.promotion", Car.class)
                          .list();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public List<Promotion> getAllPromotions() {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery("FROM Promotion", Promotion.class).list();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public List<Make> getAllMakes() {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery("FROM Make", Make.class).list();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Make getMakeById(int makeId) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.get(Make.class, makeId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Promotion getPromotionById(int promotionId) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.get(Promotion.class, promotionId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean insertCar(Car car) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(car);
            tx.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateCar(Car car) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(car);
            tx.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public Car getCarById(int carId) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery(
                "SELECT c FROM Car c LEFT JOIN FETCH c.make LEFT JOIN FETCH c.promotion WHERE c.carId = :carId", Car.class)
                .setParameter("carId", carId)
                .uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public boolean deleteCar(int carId) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            Car car = session.get(Car.class, carId);
            if (car != null) {
                session.delete(car);
                tx.commit();
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<Car> getCarsByMake(int makeId) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery(
                    "FROM Car c LEFT JOIN FETCH c.make LEFT JOIN FETCH c.promotion WHERE c.make.makeId = :makeId", Car.class)
                    .setParameter("makeId", makeId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public List<Car> searchCarsByKeyword(String keyword) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            return session.createQuery(
                "FROM Car c LEFT JOIN FETCH c.make LEFT JOIN FETCH c.promotion " +
                "WHERE c.model LIKE :kw OR c.make.name LIKE :kw", Car.class)
                .setParameter("kw", "%" + keyword + "%")
                .list();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public boolean insertPromotion(Promotion promotion) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(promotion);
            tx.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updatePromotion(Promotion promotion) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            session.update(promotion);
            tx.commit();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deletePromotion(int promotionId) {
        try (Session session = HibernateConnection.doHibernateConnection().openSession()) {
            Transaction tx = session.beginTransaction();
            Promotion promotion = session.get(Promotion.class, promotionId);
            if (promotion != null) {
                session.delete(promotion);
                tx.commit();
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
