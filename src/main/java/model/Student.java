package model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity
@Data
public class Student {
    @Id
    private Long studentId;
    private String name;
    private String surname;
    private Date dateOfBirth;
    private String primarySkill;
    private Date createdDatetime;
    private Date updatedDatetime;
}
