package com.controller;

import com.model.*;
import com.model.viewmodel.*;
import com.service.*;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.JstlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    private final UserService userService;
    private final FACULTYService facultyService;
    private final STUDENTService studentService;
    private final CLASSROOMService classroomService;
    private final STUDENT_REQUESTService student_requestService;
    private final STUDENT_REGISTERService student_registerService;
    private final TASKService taskService;
    private final SUBMIT_TASKService submitTaskService;

    public StudentController(UserService userService,SUBMIT_TASKService submitTaskService,TASKService taskService, STUDENTService studentService, FACULTYService facultyService, STUDENT_REQUESTService student_requestService,STUDENT_REGISTERService student_registerService,CLASSROOMService classroomService) {
        this.userService = userService;
        this.facultyService = facultyService;
        this.studentService = studentService;
        this.student_requestService = student_requestService;
        this.student_registerService= student_registerService;
        this.classroomService= classroomService;
        this.taskService= taskService;
        this.submitTaskService= submitTaskService;

    }


    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
        // webDataBinder.registerCustomEditor(UserDetail.class, new UserContactController.UserDetailEditor());
    }


    public boolean checkSession(HttpServletRequest request)
    {
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        String post = (String) session.getAttribute("post");

        if(username==null&&post==null)
        {
            return false;

        }
        else if(username==null||post==null)
        {
            return false;

        }
        else{
            if(!post.equals("STUDENT"))
            {
                return false;
            }
            else{
                return true;
            }
        }


    }





    @RequestMapping("/profile")
    public String profile(Model model, HttpServletRequest request, HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        STUDENT student= studentService.getid(username);
        model.addAttribute("user", student);
        return "/Student/Profile";
    }


    @RequestMapping(value = "/editprofile", method = RequestMethod.GET)
    public String getStudent(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        STUDENT student= studentService.getid(username);

        EditStudentVM studentVM= new EditStudentVM();
        studentVM.setStudentID(student.getStudentId());
        studentVM.setEmail(student.getEmail());
        studentVM.setFirstName(student.getFirstName());
        studentVM.setLastName(student.getLastName());
        model.addAttribute("student", studentVM);
        return "Student/EditProfile";
    }

    @RequestMapping(value = "/editprofile", method = RequestMethod.POST)
    public String postStudent(@Valid @ModelAttribute("student") EditStudentVM student, BindingResult bindingResult, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Student/EditProfile";
        }
        STUDENT updatedStudent=studentService.getid(student.getStudentID());

        updatedStudent.setFirstName(student.getFirstName());
        updatedStudent.setLastName(student.getLastName());

        studentService.update(updatedStudent);
        return "redirect:/student/profile";
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.GET)
    public String getPassword(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        ForgotPasswordVM forgotPasswordVM = new ForgotPasswordVM();
        model.addAttribute("password", forgotPasswordVM);
        return "/Student/ChangePassword";
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
    public String postPassword(@Valid @ModelAttribute("forgotPasswordVM") ForgotPasswordVM forgotPasswordVM, BindingResult bindingResult,Model model, HttpServletRequest request,  HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Student/ChangePassword";
        }

        if(forgotPasswordVM.getPassword()==null||forgotPasswordVM.getNewPassword()==null)
        {
            model.addAttribute("message", "Password should not be empty");
             return "/Student/ChangePassword";
        }
        else{
            HttpSession session = request.getSession(false);
            String username = (String) session.getAttribute("uname");
            User student=userService.get(username);
            if(student.getPassword().equals(forgotPasswordVM.getPassword()))
            {
                student.setPassword(forgotPasswordVM.getNewPassword());
                userService.update(student);
                return "redirect:/student/profile";
            }
            else{
                model.addAttribute("message", "Your current password didn't match.");
                return "/Student/ChangePassword";

            }
        }



    }


    @RequestMapping("/viewclassroomtable")
    public String viewclassroomtable(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        List<CLASSROOM> classrooms= new ArrayList<>();

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        List<STUDENT_REGISTER> studentreg=student_registerService.findByStudentId(username);
       for(STUDENT_REGISTER singlereg:studentreg)
       {
          classrooms.add(classroomService.findByRoomId(singlereg.getRoomId()));


       }

        model.addAttribute("classrooms", classrooms);
        model.addAttribute("msg",classrooms.size() );

        return "/Student/ViewClassRoomTable";
    }
    @RequestMapping(value = "/classroomsession", method = RequestMethod.GET)
    public String classroomsession(@RequestParam("roomId") String roomId, Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String uname = (String) session.getAttribute("uname");
        CLASSROOM classroom=classroomService.findByRoomId(roomId);
        STUDENT_REGISTER student_register= student_registerService.checkregistered(uname,roomId);
        if(student_register!=null)
        {
            request.getSession().setAttribute("roomid", classroom.getRoomId());
            return "redirect:/student/viewclassroom";
        }
        return "redirect:/student/viewclassroomtable";
    }

    @RequestMapping("/viewclassroom")
    public String viewclassroom( Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");
        CLASSROOM user=classroomService.findByRoomId(roomId);
        model.addAttribute("user", user);
        return "/Student/ViewClassRoom";
    }



    @RequestMapping(value = "/deleteclassroom", method = RequestMethod.GET)
    public String leaveclassroom(@RequestParam("roomId") String roomId,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");

        STUDENT_REGISTER student_register= student_registerService.checkregistered(username,roomId);
        if(student_register!=null)
        {
            student_registerService.deleteStudent(username,roomId);
            return "redirect:/student/viewclassroomtable";

        }
        return "redirect:/student/viewclassroomtable";


    }

    @RequestMapping(value = "/searchclassroom", method = RequestMethod.GET)
    public String getClass(Model model,SearchVM searchVM,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        List<CLASSROOM> classrooms = classroomService.getAll();

        List<StudentReqVM> studentReqVMS = new ArrayList<>();

        for(CLASSROOM detail:classrooms)
        {

STUDENT_REGISTER student_register=student_registerService.checkregistered(username,detail.getRoomId());
if(student_register==null)
{
    STUDENT_REQUEST student_request= student_requestService.checkRequested(username,detail.getRoomId());
    StudentReqVM studentReqVM= new StudentReqVM();
    studentReqVM.setRoomId(detail.getRoomId());
    studentReqVM.setFacultyId(detail.getFacultyId());
    studentReqVM.setCourseName(detail.getCourseName());
    studentReqVM.setCourseSection(detail.getCourseSection());
    if(student_request!=null)
    {
        studentReqVM.setStatus("PENDING");
    }
    if(student_request==null)
    {
        studentReqVM.setStatus("NULL");
    }

    studentReqVMS.add(studentReqVM);

}

        }

        model.addAttribute("classrooms", studentReqVMS);
        model.addAttribute("class", searchVM);
        model.addAttribute("msg",studentReqVMS.size() );

        return "/Student/SearchClassRoom";
    }

    @RequestMapping(value = "/searchclassroom", method = RequestMethod.POST)
    public String postClass(@Valid @ModelAttribute("class") SearchVM searchVM, BindingResult bindingResult,Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Student/SearchClassRoom";
        }
        List<CLASSROOM> classrooms = classroomService.findSearch(searchVM.getText());
        List<StudentReqVM> studentReqVMS = new ArrayList<>();
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");

        for(CLASSROOM detail:classrooms)
        {
            STUDENT_REGISTER student_register=student_registerService.checkregistered(username,detail.getRoomId());
            if(student_register==null)
            {
                STUDENT_REQUEST student_request= student_requestService.checkRequested(username,detail.getRoomId());
                StudentReqVM studentReqVM= new StudentReqVM();
                studentReqVM.setRoomId(detail.getRoomId());
                studentReqVM.setFacultyId(detail.getFacultyId());
                studentReqVM.setCourseName(detail.getCourseName());
                studentReqVM.setCourseSection(detail.getCourseSection());
                if(student_request!=null)
                {
                    studentReqVM.setStatus("PENDING");
                }
                if(student_request==null)
                {
                    studentReqVM.setStatus("NULL");
                }

                studentReqVMS.add(studentReqVM);

            }

        }


        model.addAttribute("classrooms", studentReqVMS);
        model.addAttribute("msg",studentReqVMS.size() );

        return "/Student/SearchClassRoom";
    }

    private static final String dformat = "dd/MM/yyyy, EEEEEE, MMMM, HH:mm:ss:SSS, zzzzzzzz:Z";
    @NotNull
    public static String intime() {
        Calendar calendar= Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(dformat);
        String date = dateFormat.format(calendar.getTime());

        return date;
    }

    @RequestMapping(value = "/joinclassroom")
    public String joinclassroom(@RequestParam("roomId") String roomId,Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String uname = (String) session.getAttribute("uname");
        STUDENT_REGISTER student_register= student_registerService.checkregistered(uname,roomId);
        if(student_register==null)
        {

            String username = (String) session.getAttribute("uname");
            STUDENT_REQUEST student_request= new STUDENT_REQUEST();
            student_request.setStudentId(username);
            student_request.setRoomId(roomId);
            student_request.setRequestTime(intime());
            student_requestService.save(student_request);

            return "redirect:/student/searchclassroom";
        }
        return "redirect:/student/searchclassroom";




    }

    public String[] timeDifference(String start, String end)
    {

        SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm");

        Date d1 = null;
        Date d2 = null;
        try {
            d1 = format.parse(start);
            d2 = format.parse(end);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        long diff = d2.getTime() - d1.getTime();
        long second = diff / 1000;
        long minute = diff / (60 * 1000);
        long hour = diff / (60 * 60 * 1000);

        String[] status = new String[3];
        status[2] = java.lang.String.valueOf(second);
        status[1] = java.lang.String.valueOf(minute);
        status[0] = java.lang.String.valueOf(hour);

        return status;

    }
    public int timeChecker(String start, String end) {
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date1 = sdf.parse(start);
            Date date2 = sdf.parse(end);

            if (date1.after(date2))
            {
                return 1;
            }
            else if(date2.after(date1))
            {
                return 2;
            }
            else{
                return 3;
            }
        }
        catch(ParseException ex){
            ex.printStackTrace();
        }
        return 0;

    }



    public String status(String start,String end)
    {

        Calendar calendar= Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String now = dateFormat.format(calendar.getTime());
        String taskStatus=null;

        if (timeChecker(start,now)==1)
        {
            return taskStatus="WAITING";
        }
        if ((timeChecker(now,start)==1 && timeChecker(end,now)==1 )||timeChecker(now,start)==3||timeChecker(end,now)==3)
        {
            return taskStatus="RUNNING";
        }
        if (timeChecker(now,end)==1 )
        {
            return taskStatus="EXPIRED";
        }

        return null;
    }


    @RequestMapping("/viewtasktable")
    public String viewtasktable(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        List<TASK> alltasks= taskService.getAll();
        for(TASK alltask:alltasks)
        {
            alltask.setStatus(status(alltask.getStartTime(),alltask.getEndTime()));
            taskService.update(alltask);
        }

        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");
        String studentId = (String) session.getAttribute("uname");

        List<TASK> tasks=taskService.findByRoomId(roomId);

        for(TASK task:tasks)
        {
            SUBMIT_TASK submit_task=submitTaskService.checkSubmit(task.getTaskId(),studentId);

if(!task.getStatus().equals("EXPIRED"))
{
    if(submit_task!=null)
    {
        task.setStatus("SUBMITTED");

    }
}

        }


        model.addAttribute("tasks", tasks);
        model.addAttribute("msg",tasks.size() );


        return "/Student/ViewTaskTable";
    }

    @RequestMapping(value = "/viewtask", method = RequestMethod.GET)
    public String getTask(@RequestParam("taskId") int taskId,Model model,HttpServletRequest request) {

        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        TASK task= taskService.get(taskId);

        HttpSession session = request.getSession(false);
        String uname = (String) session.getAttribute("uname");
        STUDENT_REGISTER student_register= student_registerService.checkregistered(uname,task.getRoomId());
        if(student_register!=null)
        {
            TaskVM taskVM= new TaskVM();
            taskVM.setTaskId(task.getTaskId());
            taskVM.setRoomId(task.getRoomId());
            taskVM.setTaskTitle(task.getTaskTitle());
            taskVM.setTaskDetails(task.getTaskDetails());
            taskVM.setStartTime(task.getStartTime());
            taskVM.setEndTime(task.getEndTime());
            taskVM.setTask("");
            model.addAttribute("task", taskVM);
            return "/Student/ViewTask";
        }
        return "redirect:/student/viewclassroomtable";

    }

    @RequestMapping(value = "/viewtask", method = RequestMethod.POST)
    public String postTask(@Valid @ModelAttribute("task") TaskSubmitVM taskVM, BindingResult bindingResult,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Student/ViewTask";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        STUDENT student= studentService.getid(username);
        SUBMIT_TASK task= new SUBMIT_TASK();
        task.setTaskId(taskVM.getTaskId());
        task.setStudentId(username);
        task.setStudentName(student.getFirstName()+" "+student.getLastName());
        task.setTask(taskVM.getTask());
        task.setSubmittedTime(intime());
        submitTaskService.save(task);
        return "redirect:/student/viewtasktable";

    }



    @RequestMapping(value = "/edittask", method = RequestMethod.GET)
    public String geteditTask(@RequestParam("taskId") int taskId,Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");
        String studentId = (String) session.getAttribute("uname");

        TASK task= taskService.get(taskId);

        STUDENT_REGISTER student_register= student_registerService.checkregistered(studentId,task.getRoomId());
        if(student_register!=null)
        {
            SUBMIT_TASK submit_task=submitTaskService.checkSubmit(task.getTaskId(),studentId);
            TaskVM taskVM= new TaskVM();
            taskVM.setTaskId(task.getTaskId());
            taskVM.setRoomId(task.getRoomId());
            taskVM.setTaskTitle(task.getTaskTitle());
            taskVM.setTaskDetails(task.getTaskDetails());
            taskVM.setStartTime(task.getStartTime());
            taskVM.setEndTime(task.getEndTime());
            taskVM.setTask(submit_task.getTask());
            model.addAttribute("task", taskVM);
            return "/Student/EditTask";
        }
        return "redirect:/student/viewclassroomtable";



    }

    @RequestMapping(value = "/edittask", method = RequestMethod.POST)
    public String posteditTask(@Valid @ModelAttribute("task") TaskSubmitVM taskVM, BindingResult bindingResult,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Student/EditTask";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        STUDENT student= studentService.getid(username);
        SUBMIT_TASK task=submitTaskService.checkSubmit(taskVM.getTaskId(),username);
        task.setTask(taskVM.getTask());
        task.setSubmittedTime(intime());
        submitTaskService.update(task);
        return "redirect:/student/viewtasktable";

    }


    @RequestMapping(value = "/viewsubmission", method = RequestMethod.GET)
    public String viewsubmit(@RequestParam("taskId") int taskId,Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");

        TASK task= taskService.get(taskId);


        STUDENT_REGISTER student_register= student_registerService.checkregistered(username,task.getRoomId());
        if(student_register!=null)
        {
            SUBMIT_TASK submit_task=submitTaskService.checkSubmit(task.getTaskId(),username);
            TaskVM taskVM= new TaskVM();
            taskVM.setTaskId(task.getTaskId());
            taskVM.setRoomId(task.getRoomId());
            taskVM.setTaskTitle(task.getTaskTitle());
            taskVM.setTaskDetails(task.getTaskDetails());
            taskVM.setStartTime(task.getStartTime());
            taskVM.setEndTime(task.getEndTime());
            if(submit_task!=null)
            {
                taskVM.setTask(submit_task.getTask());
            }
           else{
                taskVM.setTask("");
            }

            model.addAttribute("task", taskVM);
            return "/Student/ViewSubmission";
        }
        return "redirect:/student/viewclassroomtable";


    }



    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        return "redirect:/home/logout";
    }
}
