package tn.todolist.todolist_back.entity;


import lombok.*;


import javax.persistence.*;
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
    @Enumerated(EnumType.STRING)
    private Status status ;
}
