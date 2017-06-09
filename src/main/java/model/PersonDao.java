package model;

import entity.Person;

import java.util.List;

/**
 * Created by Student on 2017/6/9.
 */
public interface PersonDao {
    void add(Person person);
    List<Person> listPersons();
}