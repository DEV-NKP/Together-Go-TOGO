package com.controller;

import com.model.*;
import com.model.viewmodel.EditFacultyVM;
import com.model.viewmodel.FacultyInfoVM;
import com.model.viewmodel.ForgotPasswordVM;
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
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserService userService;
    private final ADMINService adminService;
    private final FACULTYService facultyService;
    private final CLASSROOMService classroomService;
    private final STUDENT_REQUESTService student_requestService;
    private final STUDENT_REGISTERService student_registerService;
    private final SUBMIT_TASKService submit_taskService;
    private final TASKService taskService;

    public AdminController(UserService userService,TASKService taskService,SUBMIT_TASKService submit_taskService,STUDENT_REGISTERService student_registerService,STUDENT_REQUESTService student_requestService,CLASSROOMService classroomService, ADMINService adminService, FACULTYService facultyService) {
        this.userService = userService;
        this.adminService = adminService;
        this.facultyService = facultyService;
        this.classroomService = classroomService;
        this.student_requestService = student_requestService;
        this.student_registerService = student_registerService;
        this.submit_taskService = submit_taskService;
        this.taskService = taskService;

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
            if(!post.equals("ADMIN"))
            {
                return false;
            }
            else{
                return true;
            }
        }


    }




    @RequestMapping("/profile")
    public String profile(Model model, HttpServletRequest request,  HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        ADMIN admin=adminService.get(username);
        model.addAttribute("user", admin);
        return "/Admin/Profile";
    }

    @RequestMapping(value = "/editprofile", method = RequestMethod.GET)
    public String getAdmin(Model model, HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("uname");
        ADMIN admin=adminService.get(username);

        model.addAttribute("admin", admin);
        return "/Admin/EditProfile";
    }

    @RequestMapping(value = "/editprofile", method = RequestMethod.POST)
    public String postAdmin(@Valid @ModelAttribute("admin") ADMIN admin, BindingResult bindingResult,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        if (bindingResult.hasErrors()) {
            return "/Admin/EditProfile";
        }

        ADMIN updatedAdmin=adminService.get(admin.getAdminId());

        updatedAdmin.setFirstName(admin.getFirstName());
        updatedAdmin.setLastName(admin.getLastName());

         adminService.update(updatedAdmin);
        return "redirect:/admin/profile";
    }


    @RequestMapping(value = "/changepassword", method = RequestMethod.GET)
    public String getPassword(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }


        ForgotPasswordVM forgotPasswordVM = new ForgotPasswordVM();
        model.addAttribute("forgotPasswordVM", forgotPasswordVM);
        return "/Admin/ChangePassword";
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
    public String postPassword(@Valid @ModelAttribute("forgotPasswordVM") ForgotPasswordVM forgotPasswordVM, BindingResult bindingResult,Model model, HttpServletRequest request,  HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        if (bindingResult.hasErrors()) {
            return "/Admin/ChangePassword";
        }


        if(forgotPasswordVM.getPassword()==null||forgotPasswordVM.getNewPassword()==null)
        {
            model.addAttribute("message", "Password should not be empty");
            return "/Admin/ChangePassword";
        }
        else{
            HttpSession session = request.getSession(false);
            String username = (String) session.getAttribute("uname");
            User admin=userService.get(username);
            if(admin.getPassword().equals(forgotPasswordVM.getPassword()))
            {
                admin.setPassword(forgotPasswordVM.getNewPassword());
                userService.update(admin);
                return "redirect:/admin/profile";
            }
            else{
                model.addAttribute("message", "Your current password didn't match.");
                return "/Admin/ChangePassword";

            }
        }

    }


    @RequestMapping(value = "/addfaculty", method = RequestMethod.GET)
    public String getFaculty(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        FacultyInfoVM facultyInfoVM = new FacultyInfoVM();
        model.addAttribute("facultyInfoVM", facultyInfoVM);
        return "/Admin/AddFaculty";
    }

    @RequestMapping(value = "/addfaculty", method = RequestMethod.POST)
    public String postFaculty(@Valid @ModelAttribute("facultyInfoVM") FacultyInfoVM facultyInfoVM, BindingResult bindingResult,Model model, HttpServletRequest request,  HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        if (bindingResult.hasErrors()) {
            return "/Admin/AddFaculty";
        }
        User findUser= userService.get(facultyInfoVM.getFacultyID());
        User findFaculty= userService.getemail(facultyInfoVM.getEmail());
        if(findUser==null )
        {
            if(findFaculty==null)
            {
                User user= new User();
                user.setUsername(facultyInfoVM.getFacultyID());
                user.setEmail(facultyInfoVM.getEmail());
                user.setPassword(facultyInfoVM.getPassword());
                user.setPost("FACULTY");
                user.setEnabled(true);
                userService.save(user);

                FACULTY faculty=new FACULTY();
                faculty.setFacultyId(facultyInfoVM.getFacultyID());
                faculty.setFirstName(facultyInfoVM.getFirstName());
                faculty.setLastName(facultyInfoVM.getLastName());
                faculty.setGender(facultyInfoVM.getGender());
                faculty.setEmail(facultyInfoVM.getEmail());
                faculty.setDesignation(facultyInfoVM.getDesignation());
                facultyService.save(faculty);

                return "redirect:/admin/showfaculty";
            }
            else{

                model.addAttribute("message", "Already registered Email in our database.");
                return "/Admin/AddFaculty";
            }

        }
        else{

            model.addAttribute("message", "Already registered ID in our database.");
            return "/Admin/AddFaculty";
        }

    }

    @RequestMapping("/showfaculty")
    public String showfaculty(Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        List<FACULTY> facultys=facultyService.getAll();
        model.addAttribute("facultys", facultys);
        model.addAttribute("msg",facultys.size() );
        return "/Admin/ShowFaculty";
    }

    @RequestMapping("/facultyprofile")
    public String facultyprofile(@RequestParam("facultyId") String facultyId, Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        FACULTY user=facultyService.get(facultyId);
        model.addAttribute("user", user);
        return "/Admin/FacultyProfile";
    }

    @RequestMapping(value = "/editprofilefaculty", method = RequestMethod.GET)
    public String getfacultyprofile(@RequestParam("facultyId") String facultyId, Model model,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }


        FACULTY facultyFind =facultyService.get(facultyId);

        EditFacultyVM faculty= new EditFacultyVM();
        faculty.setFacultyID(facultyFind.getFacultyId());
        faculty.setEmail(facultyFind.getEmail());
        faculty.setFirstName(facultyFind.getFirstName());
        faculty.setLastName(facultyFind.getLastName());
        faculty.setDesignation(facultyFind.getDesignation());
        model.addAttribute("faculty", faculty);
        return "/Admin/EditProfileFaculty";
    }

    @RequestMapping(value = "/editprofilefaculty", method = RequestMethod.POST)
    public String postfacultyprofile(@Valid @ModelAttribute("faculty") EditFacultyVM faculty, BindingResult bindingResult, Model model, HttpServletRequest request, HttpServletResponse response) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        if (bindingResult.hasErrors()) {
            return "/Admin/EditProfileFaculty";
        }

        if(faculty.getDesignation()==null)
        {
            model.addAttribute("message", "Faculty should be contain a designation.");
            return "/Admin/EditProfileFaculty";
        }

            FACULTY updatedFaculty= facultyService.get(faculty.getFacultyID());
            updatedFaculty.setFirstName(faculty.getFirstName());
            updatedFaculty.setLastName(faculty.getLastName());
            updatedFaculty.setDesignation(faculty.getDesignation());
            facultyService.update(updatedFaculty);
            return "redirect:/admin/showfaculty";



    }

    @RequestMapping(value = "/deleteprofilefaculty", method = RequestMethod.GET)
    public String deletefacultyprofile(@RequestParam("facultyId") String facultyId,HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        facultyService.delete(facultyId);
        userService.delete(facultyId);
       List<CLASSROOM> classrooms= classroomService.searchByFac(facultyId);
       for(CLASSROOM classroom:classrooms)
       {

           List<TASK> tasks= taskService.findByRoomId(classroom.getRoomId());
           for(TASK task:tasks) {
               List<SUBMIT_TASK> submit_tasks= submit_taskService.get(task.getTaskId());
               for(SUBMIT_TASK submit_task:submit_tasks) {


                   submit_taskService.delete(submit_task.getSubmitId());
               }

               taskService.delete(task.getTaskId());
           }



           List<STUDENT_REGISTER> student_registers= student_registerService.searchbyRoomID(classroom.getRoomId());
           for(STUDENT_REGISTER student_register:student_registers) {

               student_registerService.delete(student_register.getRegId());
           }

           List<STUDENT_REQUEST> student_requests= student_requestService.searchRequestRoom(classroom.getRoomId());
           for(STUDENT_REQUEST student_request:student_requests) {

               student_requestService.delete(student_request.getReqId());
           }

           classroomService.delete(classroom.getRoomNo());


       }




        return "redirect:/admin/showfaculty";
    }


    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        if(checkSession(request)==false)
        {
            return "redirect:/home/login";
        }

        return "redirect:/home/logout";
    }

  /*  @RequestMapping("/one")
    public String show(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) principal;
        model.addAttribute("loggedInUser", ((User) principal).getUsername());
        return "show";
    }*/


}
