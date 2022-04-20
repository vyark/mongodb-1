package model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class ExamResults {
    @Id
    private Long examId;
    private Long studentId;
    private Long subjectId;
    private Integer mark;
}
