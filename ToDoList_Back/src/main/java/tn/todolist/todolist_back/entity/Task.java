package tn.todolist.todolist_back.entity;


import lombok.*;


import jakarta.persistence.*;
import java.time.LocalTime;
import java.util.Date;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String taskTitle;
    @Enumerated(EnumType.STRING)
    private Category category;
    private String description;
    @Temporal(TemporalType.DATE)
    private Date date;
    private LocalTime localTime;
}
