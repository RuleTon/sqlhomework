package repositories;

import entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManagerFactory;
import java.util.List;

@Component
public class Crud {
    private static SessionFactory factory = new Configuration()
            .configure("configs/products/hibernate.cfg.xml")
            .buildSessionFactory();

    private SessionFactory sessionFactory;

    @Autowired
    public Crud(EntityManagerFactory factory) {
        if(factory.unwrap(SessionFactory.class) == null) {
            throw new NullPointerException("not hibernate");
        }
        this.sessionFactory = factory.unwrap(SessionFactory.class);
    }

//   public static void init() {
 //      PrepareDataApp.forcePrepareData();
//  }

    public static void showManyItems() {
        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();

            List<Product> items = session.createQuery("from Product ").getResultList();
            System.out.println(items + "\n");

            Product si1 = session.createQuery("select p from Product p where p.id = 3", Product.class).getSingleResult();
            System.out.println(si1 + "\n");

            List<Product> cheapItems = session.createQuery("select p from Product p where p.cost < 80").getResultList();
            System.out.println(cheapItems + "\n");

            session.getTransaction().commit();
        }
    }

    public static void shutdown() {
        factory.close();
    }

    public static void add(Product product) {
        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();
            Product tea = new Product(6L, "Tea", 100);
            session.save(tea);
            session.getTransaction().commit();

        }
    }

    public static void readAndPrintExample() {
        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();
            Product simpleItem = session.get(Product.class, 1L);
            System.out.println(simpleItem);
            session.getTransaction().commit();
        }
    }

    public static void updateExample() {
        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();
            Product product = session.get(Product.class, 1L);
            product.setCost(10000);
            product.setCost(10);
            session.getTransaction().commit();
        }
    }

    public static void deleteExample() {
        try (Session session = factory.getCurrentSession()) {
            session.beginTransaction();
            Product product = session.get(Product.class, 1L);
            session.delete(product);
            session.getTransaction().commit();
        }
    }

    public static void main(String[] args) {
        try {
     //       init();
            add();
            // readAndPrintExample();
            // updateExample();
            // deleteExample();
            showManyItems();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            shutdown();
        }
    }

    private static void add() {
    }
}
