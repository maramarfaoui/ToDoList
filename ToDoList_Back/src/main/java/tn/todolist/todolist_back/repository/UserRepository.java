package tn.todolist.todolist_back.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tn.todolist.todolist_back.entity.*;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
}
