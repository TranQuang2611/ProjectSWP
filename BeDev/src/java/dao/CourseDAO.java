/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import modal.Category;
import modal.Course;
import modal.Expert;

/**
 *
 * @author Admin
 */
public class CourseDAO extends DBContext {

    /**
     * This method get list course from database
     *
     * @return a list of course
     */
    public List<Course> listCourse() {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select c.courseID, c.courseName, c.courseImage, e.expertID, "
                    + "e.name, e.imageURL, c.price, eoc.enrolCourse, "
                    + "loc.numberLesson, aoc.averageStar from Course c left join "
                    + "Expert e on e.expertID = c.expertID left join (select c.courseID, "
                    + "COUNT(c.courseID) as numberLesson  from Course c, Chapter ch, "
                    + "Lesson l where c.courseID = ch.courseID and ch.chapterID = l.chapterID "
                    + "group by c.courseID) loc on c.courseID = loc.courseID left join "
                    + "(select e.courseID, COUNT(e.courseID) as enrolCourse  from Enroll e "
                    + "group by e.courseID) eoc on c.courseID = eoc.courseID left join "
                    + "(select r.courseID, AVG(star) as averageStar from Rate r group by "
                    + "r.courseID) aoc on c.courseID = aoc.courseID where c.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3),
                        new Expert(rs.getInt(4), rs.getString(5), rs.getString(6)),
                        rs.getDouble(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * This method get list course by category ID from database
     *
     * @return a list of course
     */
    public List<Course> listCourseCategory(String categoryID) {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select c.courseID, c.courseName, c.courseImage, e.expertID, "
                    + "e.name, e.imageURL, c.price, eoc.enrolCourse, "
                    + "loc.numberLesson, aoc.averageStar from Course c left join "
                    + "Expert e on e.expertID = c.expertID left join (select c.courseID, "
                    + "COUNT(c.courseID) as numberLesson  from Course c, Chapter ch, "
                    + "Lesson l where c.courseID = ch.courseID and ch.chapterID = l.chapterID "
                    + "group by c.courseID) loc on c.courseID = loc.courseID left join "
                    + "(select e.courseID, COUNT(e.courseID) as enrolCourse  from Enroll e "
                    + "group by e.courseID) eoc on c.courseID = eoc.courseID left join "
                    + "(select r.courseID, AVG(star) as averageStar from Rate r group by "
                    + "r.courseID) aoc on c.courseID = aoc.courseID left join "
                    + "Course_Category cc on cc.courseID = c.courseID where cc.categoryID = ? and c.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, categoryID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3),
                        new Expert(rs.getInt(4), rs.getString(5), rs.getString(6)),
                        rs.getDouble(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * This method get list top 6 courses have highest register
     *
     * @return a list of course
     */
    public List<Course> listFeatureCourse() {
        List<Course> list = new ArrayList<>();
        try {
            LessonDAO le = new LessonDAO();
            EnrollDAO en = new EnrollDAO();
            String sql = "select co.*, e.name, e.imageURL from Course co, Expert e\n"
                    + "where co.courseID in (select a.courseID from  (select top(6) e.courseID, count(*) as Number_Registed from Enroll e, Course c\n"
                    + "where e.courseID = c.courseID\n"
                    + "group by e.courseID\n"
                    + "order by Number_Registed desc ) as a) and co.expertID = e.expertID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), new Expert(rs.getInt(5), rs.getString(9), rs.getString(10), "", ""), rs.getDouble(6), rs.getDate(7), rs.getBoolean(8), en.countEnrollOfCourse(rs.getInt(1)), le.countLessonOfCourse(rs.getInt(1))));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * This method get list courses of expert
     *
     * @param id is id of expert
     * @return a list of courses
     */
    public List<Course> listCourseByExpert(int id) {
        List<Course> list = new ArrayList<>();
        try {
            LessonDAO le = new LessonDAO();
            EnrollDAO en = new EnrollDAO();
            String sql = "select c.*, e.name from Course c, Expert e\n"
                    + "	where c.expertID = e.expertID and e.expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), new Expert(rs.getInt(5), rs.getString(9), "", "", ""), rs.getDouble(6), rs.getDate(7), rs.getBoolean(8), en.countEnrollOfCourse(rs.getInt(1)), le.countLessonOfCourse(rs.getInt(1))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * This method count number course create by expert
     *
     * @param id is id of expert
     * @return number of course
     */
    public int countCourseOfExpert(int id) {
        try {
            String sql = "select count(*) from Course\n"
                    + "where expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public boolean checkStudentEnrollByQuizID(int quizID, int studentID) {
        try {
            String sql = "select e.* from Enroll e, Quiz q, Chapter c where q.chapterID = c.chapterID and c.courseID = e.courseID and "
                    + "q.quizID = ? and e.studentID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizID);
            stm.setInt(2, studentID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * This method get course by course ID
     *
     * @return a course
     */
    public Course getCourseById(String courseID) {
        try {
            String sql = "select c.courseID, c.courseName, c.description, c.courseImage, "
                    + "e.expertID, e.name, e.imageURL, e.description, c.price, c.releasedDate, "
                    + "eoc.enrolCourse, loc.numberLesson, aoc.averageStar "
                    + "from Course c left join Expert e on e.expertID = c.expertID "
                    + "left join (select c.courseID, COUNT(c.courseID) as numberLesson "
                    + "from Course c, Chapter ch, Lesson l where c.courseID = ch.courseID "
                    + "and ch.chapterID = l.chapterID group by c.courseID) loc "
                    + "on c.courseID = loc.courseID left join (select e.courseID, "
                    + "COUNT(e.courseID) as enrolCourse  from Enroll e group by e.courseID) "
                    + "eoc on c.courseID = eoc.courseID left join (select r.courseID, "
                    + "AVG(star) as averageStar from Rate r group by r.courseID) "
                    + "aoc on c.courseID = aoc.courseID where c.courseID = ? and c.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        new Expert(rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)),
                        rs.getDouble(9), rs.getDate(10), rs.getInt(11), rs.getInt(12), rs.getInt(13));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * This method get 4 course by category ID and don't get a course have below
     * course ID
     *
     * @return a list of course
     */
    public List<Course> relatedCourse(String courseID, int categoryID) {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select top 4 c.courseID, c.courseName, c.courseImage, e.expertID, "
                    + "e.name, e.imageURL, c.price, eoc.enrolCourse, "
                    + "loc.numberLesson, aoc.averageStar from Course c left join "
                    + "Expert e on e.expertID = c.expertID left join (select c.courseID, "
                    + "COUNT(c.courseID) as numberLesson  from Course c, Chapter ch, "
                    + "Lesson l where c.courseID = ch.courseID and ch.chapterID = l.chapterID "
                    + "group by c.courseID) loc on c.courseID = loc.courseID left join "
                    + "(select e.courseID, COUNT(e.courseID) as enrolCourse  from Enroll e "
                    + "group by e.courseID) eoc on c.courseID = eoc.courseID left join "
                    + "(select r.courseID, AVG(star) as averageStar from Rate r group by "
                    + "r.courseID) aoc on c.courseID = aoc.courseID left join "
                    + "Course_Category cc on cc.courseID = c.courseID where cc.categoryID = ? and c.courseID != ? and c.status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryID);
            stm.setString(2, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3),
                        new Expert(rs.getInt(4), rs.getString(5), rs.getString(6)),
                        rs.getDouble(7), rs.getInt(8), rs.getInt(9), rs.getInt(10)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * This method enroll a course by course ID
     * @param courseID
     * @param accountID
     */
    public void enrollCourse(String courseID, int accountID) {
        try {
            String sql = "insert into Enroll values (?, ?, GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, courseID);
            stm.setInt(2, accountID);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * This method insert a payment into transaction history by course ID
     * @param courseID 
     * @param studentID 
     * @param amount 
     */
    public void insertTransctionHistory(int courseID, int studentID, double amount) {
        try {
            String sql = "insert into Transaction_History (courseID, studentID, amount) values (?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            stm.setInt(2, studentID);
            stm.setDouble(3, amount);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Course> getCourseByStudentId(int id) {
        try {
            CourseDAO dao = new CourseDAO();
            List<Course> listCourses = new ArrayList<>();
            String sql = "select c.courseID,  c.courseName, c.courseImage, c.expertID, ex.name,ex.imageURL from Enroll e, Course c , Expert ex\n"
                    + "where e.courseID =c.courseID and e.studentID =? and ex.expertID = c.expertID";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), new Expert(rs.getInt(4), rs.getString(5), rs.getString(6)));
                c.setTotalLession(dao.getTotalLessionOfCourse(rs.getInt(1)));
                c.setTotalLearned(dao.getTotalLessionLearned(rs.getInt(1), id));
                listCourses.add(c);
            }
            return listCourses;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    /**
     * this method get the number of a course
     * @param courseID
     * @return the number of lesson
     */
    public int getTotalLessionOfCourse(int courseID) {
        try {
            String sql = "select  count(c.courseID) as c1  from   Course c, Lesson l , Chapter ch\n"
                    + "where c.courseID = ch.courseID and l.chapterID = ch.chapterID and c.courseID = ?\n"
                    + "group by c.courseID";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
    /**
     * this method get the number of learned lesson of a course by a student
     * @param courseID
     * @param studentID
     * @return the number of 
     */
    public int getTotalLessionLearned(int courseID, int studentID) {
        try {
            String sql = "select  count(c.courseID) as c2 from   Course c, Lesson_Learned ll , Chapter ch, Lesson l\n"
                    + "where c.courseID = ch.courseID and l.chapterID = ch.chapterID and c.courseID = ? and ll.lessonID= l.lessonID and ll.studentID=?\n"
                    + "group by c.courseID	";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            stm.setInt(2, studentID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * This method get courses of expert
     *
     * @param id is id of expert
     * @return a list of courses
     */
    public List<Course> getCoursesByExpertId(int id) {
        List<Course> list = new ArrayList<>();
        try {
            String sql = "select c.courseID, c.courseName, c.description, c.courseImage, c.price, c.releasedDate, c.status, ca.categoryID, ca.categoryName from Course c\n"
                    + "left join Course_Category cc on cc.courseID = c.courseID \n"
                    + "left join Category ca on ca.categoryID = cc.categoryID\n"
                    + "where c.expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getDouble(5), rs.getDate(6), rs.getBoolean(7), new Category(rs.getInt(8), rs.getString(9))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     *
     * @param eid
     * @param cid
     * @return
     */
    public boolean isExpertOfCourse(int eid, int cid) {
        try {
            String sql = "select c.courseID from Course c\n"
                    + "where c.expertID = ? and c.courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     *
     * @param cid
     * @return
     */
    public boolean checkCourseExistById(int cid) {
        try {
            String sql = "select c.courseID from Course c\n"
                    + "where c.courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     *
     * @param cid
     * @param currentStatus
     * @return
     */
    public boolean changeCourseStatus(int cid, boolean currentStatus) {
        try {
            String sql = "update Course set status = ? where courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, currentStatus ? 0 : 1);
            stm.setInt(2, cid);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     *
     * @param course
     * @return
     */
    public boolean insertCourse(Course course) {
        try {
            String sql = "insert into Course (courseName, description, courseImage, expertID, price, status) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, course.getCourseName());
            stm.setString(2, course.getDescription());
            stm.setString(3, course.getCourseImage());
            stm.setInt(4, course.getExpert().getExpertID());
            stm.setDouble(5, course.getMoney());
            stm.setBoolean(6, course.isStatus());
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            int courseId = 0;
            while (rs.next()) {
                courseId = rs.getInt(1);
            }
            if (courseId == 0) {
                return false;
            }
            sql = "insert into Course_Category (courseID, categoryID) values (?, ?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);
            stm.setInt(2, course.getCategory().getCategoryID());
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     *
     * @param course
     * @return
     */
    public boolean updateCourse(Course course) {
        try {
            String sql = "update Course set courseName = ?, courseImage = ?, description = ?, price = ?, status = ? where courseId = ?\n"
                    + "delete Course_Category where courseID = ?\n"
                    + "insert into Course_Category (courseID, categoryID) values (?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, course.getCourseName());
            stm.setString(2, course.getCourseImage());
            stm.setString(3, course.getDescription());
            stm.setDouble(4, course.getMoney());
            stm.setBoolean(5, course.isStatus());
            stm.setInt(6, course.getCourseID());
            stm.setInt(7, course.getCourseID());
            stm.setInt(8, course.getCourseID());
            stm.setInt(9, course.getCategory().getCategoryID());
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteCourseById(int cid) {
        try {
            String sql = "\n"
                    + "delete [Option] where optionID in (\n"
                    + "select o.optionID from [Option] o \n"
                    + "join Question qu on qu.questionID = o.questionID \n"
                    + "join Quiz q on q.quizID = qu.quizID \n"
                    + "join Chapter c on c.chapterID = q.chapterID\n"
                    + "where c.courseID = ?)\n"
                    + "\n"
                    + "delete Question where questionID in (\n"
                    + "select qu.questionID from Question qu \n"
                    + "join Quiz q on q.quizID = qu.quizID \n"
                    + "join Chapter c on c.chapterID = q.chapterID\n"
                    + "where c.courseID = ?\n"
                    + ")\n"
                    + "\n"
                    + "delete Quiz where quizID in (\n"
                    + "select q.quizID from Quiz q \n"
                    + "join Chapter c on c.chapterID = q.chapterID\n"
                    + "where c.courseID = ?\n"
                    + ")\n"
                    + "\n"
                    + "delete Lesson where lessonID in (\n"
                    + "select l.lessonID from Lesson l\n"
                    + "join Chapter c on c.chapterID = l.chapterID\n"
                    + "where c.courseID = ?\n"
                    + ")\n"
                    + "\n"
                    + "delete Chapter where chapterID in (\n"
                    + "select c.chapterID from Chapter c where c.courseID = ?\n"
                    + ")\n"
                    + "delete Course_Category where courseID = ?\n"
                    + "delete Course where courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, cid);
            stm.setInt(3, cid);
            stm.setInt(4, cid);
            stm.setInt(5, cid);
            stm.setInt(6, cid);
            stm.setInt(7, cid);

            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     *
     * @param eid
     * @return
     */
    public int countTotalEnrollByExpertId(int eid) {
        try {
            String sql = "select count(*)from Course c \n"
                    + "join Enroll e on c.courseID = e.courseID\n"
                    + "where c.expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @return
     */
    public int countTotalEnroll() {
        try {
            String sql = "select count(*) from Course c \n"
                    + "join Enroll e on c.courseID = e.courseID\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @param eid
     * @return
     */
    public int countTotalStudentEnrollByExpertId(int eid) {
        try {
            String sql = "select count(distinct e.studentID) from Course c \n"
                    + "join Enroll e on c.courseID = e.courseID\n"
                    + "where c.expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @param eid
     * @return
     */
    public double getTotalEarningOfExpertLastMonth(int eid) {
        try {
            String sql = " select sum(th.amount) from Course c \n"
                    + " join Transaction_History th on th.courseID = c.courseID \n"
                    + " where c.expertID = ? and MONTH(th.time) = ? and YEAR(th.time) = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            stm.setInt(2, LocalDateTime.now().getMonthValue() - 1);
            stm.setInt(3, LocalDateTime.now().getYear());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @return
     */
    public double getEarningLastMonth() {
        try {
            String sql = " select sum(th.amount) from Course c \n"
                    + " join Transaction_History th on th.courseID = c.courseID \n"
                    + " where MONTH(th.time) = ? and YEAR(th.time) = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, LocalDateTime.now().getMonthValue() - 1);
            stm.setInt(2, LocalDateTime.now().getYear());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @param eid
     * @return
     */
    public double getEarningOfExpertTotal(int eid) {
        try {
            String sql = " select sum(th.amount) from Course c \n"
                    + " join Transaction_History th on th.courseID = c.courseID \n"
                    + " where c.expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @return
     */
    public double getEarningTotal() {
        try {
            String sql = " select sum(th.amount) from Course c \n"
                    + " join Transaction_History th on th.courseID = c.courseID \n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     *
     * @param eid
     * @return
     */
    public List<Course> getListCourseAnalysisByExpertId(int eid) {
        List<Course> listCourses = new ArrayList<>();
        try {
            String sql = "select c.courseID , c.courseName, count(ll.lessonID) as NumberOfView,\n"
                    + "	(select count(e.courseID) from Enroll e left join Course cc on e.courseID = cc.courseID where cc.courseID = c.courseID) as NumberOfSold,\n"
                    + "	(select sum(th.amount) from Transaction_History th where th.courseID = c.courseID) as TotalEarning,\n"
                    + "	(select AVG(r.star) from Course cc left join Rate r on cc.courseID = r.courseID where cc.courseID = c.courseID ) as Rate,\n"
                    + "	(select count(r.rateID) from Course cc left join Rate r on cc.courseID = r.courseID where cc.courseID = c.courseID ) as NumberOfRating\n"
                    + "from Course c left join Chapter ch on c.courseID = ch.courseID\n"
                    + "left join Lesson l on l.chapterID = ch.chapterID\n"
                    + "left join Lesson_Learned ll on ll.lessonID = l.lessonID\n"
                    + "where  c.expertID = ?\n"
                    + "group by c.courseID , c.courseName, c.price";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5) == null ? 0 : rs.getDouble(5), rs.getString(6) == null ? 0 : rs.getInt(6), rs.getInt(7));
                listCourses.add(course);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listCourses;
    }

    /**
     * This method get course by course ID
     *
     * @param courseID
     * @return a course
     */
    public Course getCourseById(int courseID) {
        try {
            String sql = " select c.courseID, c.courseName, c.description, c.courseImage, c.price, c.status, cc.categoryID\n"
                    + "  from Course c join Course_Category cc on cc.courseID = c.courseID\n"
                    + "  where c.courseID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, courseID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getBoolean(6), new Category(rs.getInt(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     *
     * @param expertId
     * @return
     */
    public double[] getEarningOverviewThisYearOfExpert(int expertId) {
        double[] enrollOverview = new double[LocalDate.now().getMonthValue()];
        try {
            String sql = "select Month(th.time), sum(th.amount) \n"
                    + "from Transaction_History th join Course c on c.courseID = th.courseID\n"
                    + "where c.expertID = ? and Year(th.time) = ? and Month(th.time) = ?\n"
                    + "group by Month(th.time)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, expertId);
            stm.setInt(2, LocalDate.now().getYear());
            for (int i = 1; i <= LocalDate.now().getMonthValue(); i++) {
                stm.setInt(3, i);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    enrollOverview[i - 1] = rs.getDouble(2);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return enrollOverview;
    }

    /**
     *
     * @return
     */
    public double[] getEarningOverviewThisYear() {
        double[] enrollOverview = new double[LocalDate.now().getMonthValue()];
        try {
            String sql = "select Month(th.time), sum(th.amount) \n"
                    + "from Transaction_History th join Course c on c.courseID = th.courseID\n"
                    + "where Year(th.time) = ? and Month(th.time) = ?\n"
                    + "group by Month(th.time)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, LocalDate.now().getYear());
            for (int i = 1; i <= LocalDate.now().getMonthValue(); i++) {
                stm.setInt(2, i);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    enrollOverview[i - 1] = rs.getDouble(2);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return enrollOverview;
    }
    public int checkCourseByExpertId(int eid) {
        try {
            String sql = "select count(*) from Course\n"
                    + "where expertID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        List<Course> listCourses = new ArrayList<>();
        CourseDAO dao = new CourseDAO();
        listCourses = dao.getCourseByStudentId(10);
        System.out.println(dao.getTotalLessionOfCourse(3));
        System.out.println(dao.getTotalLessionLearned(3, 10));
    }

}
