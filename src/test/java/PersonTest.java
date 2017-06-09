import config.AppConfig;
import entity.Person;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import service.PersonService;

import java.util.List;

/**
 * Created by Student on 2017/6/9.
 */
public class PersonTest {

    @Test
    public void addPersion(){
        AnnotationConfigApplicationContext context =
                new AnnotationConfigApplicationContext(AppConfig.class);

        PersonService personService = context.getBean(PersonService.class);

        // Add Persons
        personService.add(new Person("Sunil", "Bora", "suni.bora@example.com"));
        personService.add(new Person("David", "Miller", "david.miller@example.com"));
        personService.add(new Person("Sameer", "Singh", "sameer.singh@example.com"));
        personService.add(new Person("Paul", "Smith", "paul.smith@example.com"));


        context.close();
    }

    @Test
    public void getPersion(){
        AnnotationConfigApplicationContext context =
                new AnnotationConfigApplicationContext(AppConfig.class);

        PersonService personService = context.getBean(PersonService.class);

        // Get Persons
        List<Person> persons = personService.listPersons();
        for (Person person : persons) {
            System.out.println("Id = "+person.getId());
            System.out.println("First Name = "+person.getFirstName());
            System.out.println("Last Name = "+person.getLastName());
            System.out.println("Email = "+person.getEmail());
            System.out.println();
        }

        context.close();
    }
}

