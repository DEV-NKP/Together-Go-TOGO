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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Controller
@RequestMapping("/faculty")
public class FacultyController {

    private final UserService userService;
    private final CLASSROOMService classroomService;
    private final FACULTYService facultyService;
    private final STUDENT_REQUESTService student_requestService;
    private final STUDENT_REGISTERService student_registerService;
    private final STUDENTService studentService;
    private final TASKService taskService;
    private final SUBMIT_TASKService submit_taskService;
    public String status;


    public FacultyController(UserService userService,STUDENTService studentService,SUBMIT_TASKService submit_taskService, CLASSROOMService classroomService, FACULTYService facultyService, STUDENT_REQUESTService student_requestService, STUDENT_REGISTERService student_registerService, TASKService taskService) {
        this.userService = userService;
        this.classroomService = classroomService;
        this.facultyService = facultyService;
        this.student_requestService = student_requestService;
        this.student_registerService = student_registerService;
        this.studentService = studentService;
        this.taskService = taskService;
        this.submit_taskService = submit_taskService;
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
            if(!post.equals("FACULTY"))
            {
                return false;
            }
            else{
                return true;
            }
        }


    }




    ///Faculty Profile Show

    @RequestMapping("/profile")
    public String profile(Model model, HttpServletRequest request,  HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        FACULTY faculty = facultyService.get(username);
        model.addAttribute("user", faculty);
        return "/Faculty/Profile";
    }

    ///Faculty Edit Profile

    @RequestMapping(value = "/editprofile", method = RequestMethod.GET)
    public String getFaculty(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        FACULTY facultyedit = facultyService.get(username);

        EditFacultyVM faculty= new EditFacultyVM();
        faculty.setFacultyID(facultyedit.getFacultyId());
        faculty.setEmail(facultyedit.getEmail());
        faculty.setFirstName(facultyedit.getFirstName());
        faculty.setLastName(facultyedit.getLastName());
        faculty.setDesignation(facultyedit.getDesignation());
        model.addAttribute("faculty", faculty);

        return "/Faculty/EditProfile";
    }

    @RequestMapping(value = "/editprofile", method = RequestMethod.POST)
    public String postFaculty(@Valid @ModelAttribute("faculty") EditFacultyVM faculty, BindingResult bindingResult,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Faculty/EditProfile";
        }

        FACULTY updatedFaculty = facultyService.get(faculty.getFacultyID());

        updatedFaculty.setFirstName(faculty.getFirstName());
        updatedFaculty.setLastName(faculty.getLastName());

        facultyService.update(updatedFaculty);
        return "redirect:/faculty/profile";
    }

    ///Faculty Change Password

    @RequestMapping(value = "/changepassword", method = RequestMethod.GET)
    public String getPassword(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        ForgotPasswordVM forgotPasswordVM = new ForgotPasswordVM();
        model.addAttribute("forgotPasswordVM", forgotPasswordVM);
        return "/Faculty/ChangePassword";
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
    public String postPassword(@Valid @ModelAttribute("forgotPasswordVM") ForgotPasswordVM forgotPasswordVM, BindingResult bindingResult,Model model, HttpServletRequest request,  HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Faculty/ChangePassword";
        }



        if(forgotPasswordVM.getPassword()==null||forgotPasswordVM.getNewPassword()==null)
        {
            model.addAttribute("message", "Password should not be empty");
             return "/Faculty/ChangePassword";
        }
        else{
            HttpSession session = request.getSession(false);
            String username = (String) session.getAttribute("uname");
            User faculty=userService.get(username);
            if(faculty.getPassword().equals(forgotPasswordVM.getPassword()))
            {
                faculty.setPassword(forgotPasswordVM.getNewPassword());
                userService.update(faculty);
                return "redirect:/faculty/profile";
            }
            else{
                model.addAttribute("message", "Your current password didn't match.");
                return "/Faculty/ChangePassword";
            }
        }





    }

    ///Faculty Add Classrooms

    private static final String dformat = "dd/MM/yyyy, EEEEEE, MMMM, HH:mm:ss:SSS, zzzzzzzz:Z";
    @NotNull
    public static String intime() {
        Calendar calendar= Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(dformat);
        String date = dateFormat.format(calendar.getTime());

        return date;
    }

    @RequestMapping(value = "/addclassroom", method = RequestMethod.GET)
    public String getClass(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");

        String roomId = new DecimalFormat("00000").format(new Random().nextInt(99999));

        ClassVM classroom = new ClassVM();
        classroom.setFacultyId(username);
        classroom.setRoomId(roomId);
        classroom.setCourseName("");
        classroom.setCourseSection("");
        classroom.setCreateTime("");

        model.addAttribute("classroom", classroom);
        return "/Faculty/AddClassroom";
    }

    @RequestMapping(value = "/addclassroom", method = RequestMethod.POST)
    public String postClass(@Valid @ModelAttribute("classroom") ClassVM classroom, BindingResult bindingResult,Model model,HttpServletRequest request, HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Faculty/AddClassroom";
        }

        CLASSROOM findCourse= classroomService.findByRoomId(classroom.getRoomId());

            if(findCourse==null)
            {
                CLASSROOM classroomAdd = new CLASSROOM();
                classroomAdd.setFacultyId(classroom.getFacultyId());
                classroomAdd.setRoomId(classroom.getRoomId());
                classroomAdd.setCourseName(classroom.getCourseName());
                classroomAdd.setCourseSection(classroom.getCourseSection());
                classroomAdd.setCreateTime(intime());
                classroomService.save(classroomAdd);

                return "redirect:/faculty/viewclassroomtable";
            }
            else{

                model.addAttribute("message", "Already registered RoomID in our database.");
                return "Faculty/AddClassroom";
            }
    }

    ///Faculty View Classroom Table

    @RequestMapping("/viewclassroomtable")
    public String viewclassroomtable(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");

        List<CLASSROOM> classrooms = classroomService.searchByFac(username);
        model.addAttribute("msg",classrooms.size() );
        model.addAttribute("classrooms", classrooms);
        return "/Faculty/ViewClassRoomTable";
    }

    @RequestMapping(value = "/classroomsession", method = RequestMethod.GET)
    public String classroomsession(@RequestParam("roomId") String roomId, Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        CLASSROOM classroom=classroomService.findByRoomId(roomId);
        if(classroom.getFacultyId().equals(username))
        {
            request.getSession().setAttribute("roomid", classroom.getRoomId());

            return "redirect:/faculty/viewclassroom";
        }
        return "redirect:/faculty/viewclassroomtable";
    }



    @RequestMapping("/viewclassroom")
    public String viewclassroom(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");
        CLASSROOM classroom=classroomService.findByRoomId(roomId);

        request.getSession().setAttribute("roomid", classroom.getRoomId());

        model.addAttribute("classroom", classroom);
        return "/Faculty/ViewClassroom";
    }
    ///Faculty Edit Classroom

    @RequestMapping(value = "/editclassroom", method = RequestMethod.GET)
    public String getEditClass(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");

        CLASSROOM classroom = classroomService.findByRoomId(roomId);

        model.addAttribute("classroom", classroom);
        return "/Faculty/EditClassroom";
    }

    @RequestMapping(value = "/editclassroom", method = RequestMethod.POST)
    public String postEditClass(@Valid @ModelAttribute("classroom") ClassVM classroom, BindingResult bindingResult, Model model, HttpServletRequest request, HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Faculty/EditClassroom";
        }

        CLASSROOM updatedClassroom = classroomService.findByRoomId(classroom.getRoomId());

        updatedClassroom.setCourseSection(classroom.getCourseSection());
        updatedClassroom.setCourseName(classroom.getCourseName());
        classroomService.update(updatedClassroom);
        return "redirect:/faculty/viewclassroom";
    }

    ///Faculty Delete Classroom

    @RequestMapping(value = "/deleteclassroom", method = RequestMethod.GET)
    public String postDeleteClass(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");




            List<TASK> tasks= taskService.findByRoomId(roomId);
            for(TASK task:tasks) {
                List<SUBMIT_TASK> submit_tasks= submit_taskService.get(task.getTaskId());
                for(SUBMIT_TASK submit_task:submit_tasks) {


                    submit_taskService.delete(submit_task.getSubmitId());
                }

                taskService.delete(task.getTaskId());
            }



            List<STUDENT_REGISTER> student_registers= student_registerService.searchbyRoomID(roomId);
            for(STUDENT_REGISTER student_register:student_registers) {

                student_registerService.delete(student_register.getRegId());
            }

            List<STUDENT_REQUEST> student_requests= student_requestService.searchRequestRoom(roomId);
            for(STUDENT_REQUEST student_request:student_requests) {

                student_requestService.delete(student_request.getReqId());
            }

        classroomService.deleteByRoomID(roomId);


        return "redirect:/faculty/viewclassroomtable";
    }



    @RequestMapping("/viewrequests")
    public String viewrequests(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");
      List<STUDENT_REQUEST> student_requests=  student_requestService.searchRequestRoom(roomId);

      List<STUDENT> students= new ArrayList<>();
      for(STUDENT_REQUEST student_request :student_requests)
      {
          students.add(studentService.getid(student_request.getStudentId()));

      }
        model.addAttribute("msg",students.size() );
        model.addAttribute("students", students);
        return "/Faculty/ViewRequests";
    }

    @RequestMapping("/acceptstudent")
    public String acceptstudent(@RequestParam("studentId") String studentId,Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");

        STUDENT_REGISTER student_register= new STUDENT_REGISTER();
        student_register.setRoomId(roomId);
        student_register.setStudentId(studentId);
        student_registerService.save(student_register);

student_requestService.deleteRequested(studentId,roomId);
        return "redirect:/faculty/viewrequests";
    }

    @RequestMapping("/declinestudent")
    public String declinestudent(@RequestParam("studentId") String studentId,Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");

        student_requestService.deleteRequested(studentId,roomId);
        return "redirect:/faculty/viewrequests";
    }




    @RequestMapping("/viewstudents")
    public String viewstudents(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");

        List<STUDENT_REGISTER> student_registers=student_registerService.searchbyRoomID(roomId);
        List<STUDENT> students= new ArrayList<>();
        for(STUDENT_REGISTER student_register :student_registers)
        {
            students.add(studentService.getid(student_register.getStudentId()));

        }
        model.addAttribute("msg",students.size() );
        model.addAttribute("students", students);
        return "/Faculty/ViewStudents";
    }


    @RequestMapping("/removestudent")
    public String removestudent(@RequestParam("studentId") String studentId,Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String roomId = (String) session.getAttribute("roomid");

        student_registerService.deleteStudent(studentId,roomId);
        return "redirect:/faculty/viewstudents";
    }


    public String[] timeDifference(String start, String end)
    {
        String a = "2022-08-19 22:00";
        String b = "2022-08-19 23:30";
        SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm");

        Date d1 = null;
        Date d2 = null;
        try {
            d1 = format.parse(a);
            d2 = format.parse(b);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        long diff = d2.getTime() - d1.getTime();
        long second = diff / 1000;
        long minute = diff / (60 * 1000);
        long hour = diff / (60 * 60 * 1000);

        String[] status = new String[3];
        status[0] = java.lang.String.valueOf(second);
        status[1] = java.lang.String.valueOf(minute);
        status[2] = java.lang.String.valueOf(hour);

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


    ///Faculty Add Task

    @RequestMapping(value = "/addtask", method = RequestMethod.GET)
    public String getTask(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("roomid");

        TASK task = new TASK();
        task.setRoomId(username);
        model.addAttribute("task", task);
        return "/Faculty/AddTask";
    }

    @RequestMapping(value = "/addtask", method = RequestMethod.POST)
    public String postTask(@Valid @ModelAttribute("task") TaskVM task, BindingResult bindingResult, Model model, HttpServletRequest request, HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Faculty/AddTask";
        }

       if(timeChecker(task.getStartTime(),task.getEndTime())==1)
       {
           model.addAttribute("message", "Start time must be lower then End time");
           return "/Faculty/AddTask";
       }

        //TASK findTask= taskService.findByRoomId(task.getRoomId());

        TASK task1 = new TASK();
        task1.setRoomId(task.getRoomId());
        task1.setTaskTitle(task.getTaskTitle());
        task1.setTaskDetails(task.getTaskDetails());
        task1.setStartTime(task.getStartTime());
        task1.setEndTime(task.getEndTime());
        task1.setPostTime(intime());
        task1.setStatus(status(task.getStartTime(),task.getEndTime()));
        taskService.save(task1);

        return "redirect:/faculty/viewtask";
    }

    ///Faculty View Class

    @RequestMapping("/viewtask")
    public String viewtask(Model model, HttpServletRequest request) {
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


        List<TASK> tasks=taskService.findByRoomId(roomId);
        model.addAttribute("msg",tasks.size() );
        model.addAttribute("tasks", tasks);

        return "/Faculty/ViewTask";
    }


    ///Faculty Edit Task

    @RequestMapping(value = "/edittask", method = RequestMethod.GET)
    public String geteditTask(@RequestParam("taskId") int taskId,Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        TASK task = taskService.get(taskId);
        CLASSROOM classroom=classroomService.findByRoomId(task.getRoomId());
        if(classroom.getFacultyId().equals(username))
        {
            model.addAttribute("task", task);
            return "/Faculty/EditTask";
        }

        return "redirect:/faculty/viewtask";

    }

    @RequestMapping(value = "/edittask", method = RequestMethod.POST)
    public String posteditTask(@Valid @ModelAttribute("task") TaskVM task, BindingResult bindingResult, Model model, HttpServletRequest request, HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        if (bindingResult.hasErrors()) {
            return "/Faculty/EditTask";
        }

        //TASK findTask= taskService.findByRoomId(task.getRoomId());

        TASK task1 =taskService.get(task.getTaskId());
        task1.setTaskTitle(task.getTaskTitle());
        task1.setTaskDetails(task.getTaskDetails());
        task1.setStartTime(task.getStartTime());
        task1.setEndTime(task.getEndTime());
        task1.setStatus(status(task.getStartTime(),task.getEndTime()));
        taskService.update(task1);

        return "redirect:/faculty/viewtask";
    }






    public static List<String> extractUrls(String text)
    {
        List<String> containedUrls = new ArrayList<String>();
        String urlRegex = "((https?|ftp|gopher|telnet|file):((//)|(\\\\))+[\\w\\d:#@%/;$()~_?\\+-=\\\\\\.&]*)";
        Pattern pattern = Pattern.compile(urlRegex, Pattern.CASE_INSENSITIVE);
        Matcher urlMatcher = pattern.matcher(text);

        while (urlMatcher.find())
        {
            containedUrls.add(text.substring(urlMatcher.start(0),
                    urlMatcher.end(0)));
        }

        return containedUrls;
    }

    @RequestMapping("/viewsubmittedtask")
    public String viewsubmittedtask(@RequestParam("taskId") int taskId,Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }



        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        TASK task=taskService.get(taskId);
        CLASSROOM classroom=classroomService.findByRoomId(task.getRoomId());
        if(classroom.getFacultyId().equals(username))
        {


            if(task.getStatus().equals("WAITING"))
            {
                task.setPostTime(task.getStartTime());

            }
            else if(task.getStatus().equals("RUNNING")){

                task.setPostTime(task.getEndTime());
            }
            else{
                task.setPostTime("N/A");
            }



            List<SUBMIT_TASK> submit_tasks=submit_taskService.get(taskId);
            List<SubmitTaskLinkVM> submitTaskLinkVMS=new ArrayList<>();
            for(SUBMIT_TASK submit_task:submit_tasks)
            {
                SubmitTaskLinkVM submitTaskLinkVM=new SubmitTaskLinkVM();

                submitTaskLinkVM.setTask(submit_task.getTask());
                submitTaskLinkVM.setTaskId(submit_task.getTaskId());
                submitTaskLinkVM.setSubmitId(submit_task.getSubmitId());
                submitTaskLinkVM.setSubmittedTime(submit_task.getSubmittedTime());
                submitTaskLinkVM.setStudentId(submit_task.getStudentId());
                submitTaskLinkVM.setStudentName(submit_task.getStudentName());


                List<String> extractedUrls = extractUrls(submit_task.getTask());
                if(extractedUrls != null && extractedUrls.size()>0)
                {
                    submitTaskLinkVM.setLink(extractedUrls);
                }
                else{
                    submitTaskLinkVM.setLink(null);
                }
                submitTaskLinkVMS.add(submitTaskLinkVM);
            }

            model.addAttribute("task", task);
            model.addAttribute("submitTasks", submitTaskLinkVMS);
            model.addAttribute("msg",submitTaskLinkVMS.size() );
            return "/Faculty/ViewSubmittedTask";
        }

        return "redirect:/faculty/viewtask";

    }


    @RequestMapping(value = "/viewsubmission", method = RequestMethod.GET)
    public String geteditTask(@RequestParam("taskId") int taskId,@RequestParam("studentId") String studentId,Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }


        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        TASK task = taskService.get(taskId);
        CLASSROOM classroom=classroomService.findByRoomId(task.getRoomId());
        if(classroom.getFacultyId().equals(username))
        {
            SUBMIT_TASK submit_task=submit_taskService.checkSubmit(task.getTaskId(),studentId);
            TaskVM taskVM= new TaskVM();
            taskVM.setTaskId(task.getTaskId());
            taskVM.setRoomId(task.getRoomId());
            taskVM.setTaskTitle(task.getTaskTitle());
            taskVM.setTaskDetails(task.getTaskDetails());
            taskVM.setStartTime(task.getStartTime());
            taskVM.setEndTime(task.getEndTime());
            taskVM.setTask(submit_task.getTask());
            model.addAttribute("task", taskVM);
            return "/Faculty/ViewSubmission";
        }

        return "redirect:/faculty/viewtask";

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
