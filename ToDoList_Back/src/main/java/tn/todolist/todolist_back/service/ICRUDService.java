package tn.todolist.todolist_back.service;

import java.util.List;

public interface ICRUDService<Class,TypeId> {

    List<Class> findAll();
    Class findById(TypeId idItem);
    Class add(Class class1) ;
    void delete(TypeId id);
    Class update(Class Classe1);
}
