package model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class Subject {
    @Id
    private Long subjectId;
    private String subjectName;
    private String tutor;
    private Integer amountOfHours;
}
