package com.controller;

import com.model.STUDENT;
import com.model.User;
import com.model.viewmodel.ForgotPasswordVM;
import com.model.viewmodel.StudentSignupVM;
import com.service.STUDENTService;

import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/home")

public class HomeController {

    private final UserService userService;
    private final STUDENTService studentService;
    private String OTP;
    private String email;
   @Autowired
    private JavaMailSender emailSender;

    public HomeController( UserService userService,STUDENTService studentService) {
        this.userService = userService;
        this.studentService = studentService;


    }


    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
       // webDataBinder.registerCustomEditor(UserDetail.class, new UserContactController.UserDetailEditor());
    }




    @RequestMapping("/togo")
    public String home(HttpServletRequest request) {

        Cookie ck[]=request.getCookies();

        if(ck!=null)
        {
            String uname="";
            String post="";

            for(int i=0;i<ck.length;i++){
                if(ck[i].getName().equals("uname"))
                {
                    uname= ck[i].getValue();
                }
                if(ck[i].getName().equals("post"))
                {
                    post= ck[i].getValue();
                }
            }

                            if(post.equals("ADMIN"))
                            {
                                request.getSession().setAttribute("uname", uname);
                                request.getSession().setAttribute("post", post);
                                return "redirect:/admin/profile/";
                            }
                            if(post.equals("FACULTY"))
                            {
                                request.getSession().setAttribute("uname", uname);
                                request.getSession().setAttribute("post", post);
                                return "redirect:/faculty/profile/";
                            }
                            if(post.equals("STUDENT"))
                            {
                                request.getSession().setAttribute("uname", uname);
                                request.getSession().setAttribute("post", post);
                                return "redirect:/student/profile/";
                            }
        }



        return "/User/Home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getlogin(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "/User/LogIn";
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String postlogin(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, Model model, HttpServletRequest request,  HttpServletResponse response) {
        if (bindingResult.hasErrors()) {
            return "/User/LogIn";
        }

        // userContactService.save(userContact);
        User findUser= userService.checkuser(user.getUsername(), user.getPassword());
        if(findUser!=null && findUser.getPost().equals("ADMIN"))
        {

            if(request.getParameter("REMEMBER")!=null)
            {

                Cookie ckuname=new Cookie("uname",findUser.getUsername());
                ckuname.setMaxAge(30*24*3600);
                Cookie ckpost=new Cookie("post",findUser.getPost());
                ckpost.setMaxAge(30*24*3600);
                response.addCookie(ckuname);
                response.addCookie(ckpost);
              //  return "redirect:/admin/profile/remember";
            }
            request.getSession().setAttribute("uname", findUser.getUsername());
            request.getSession().setAttribute("post", findUser.getPost());
            return "redirect:/admin/profile/";
        }
        else if(findUser!=null && findUser.getPost().equals("FACULTY"))
        {
            if(request.getParameter("REMEMBER")!=null)
            {

                Cookie ckuname=new Cookie("uname",findUser.getUsername());
                ckuname.setMaxAge(30*24*3600);
                Cookie ckpost=new Cookie("post",findUser.getPost());
                ckpost.setMaxAge(30*24*3600);
                //  return "redirect:/admin/profile/remember";
                response.addCookie(ckuname);
                response.addCookie(ckpost);
            }
            request.getSession().setAttribute("uname", findUser.getUsername());
            request.getSession().setAttribute("post", findUser.getPost());
            return "redirect:/faculty/profile";
        }
        else if(findUser!=null && findUser.getPost().equals("STUDENT"))
        {
            if(request.getParameter("REMEMBER")!=null)
            {

                Cookie ckuname=new Cookie("uname",findUser.getUsername());
                ckuname.setMaxAge(30*24*3600);
                Cookie ckpost=new Cookie("post",findUser.getPost());
                ckpost.setMaxAge(30*24*3600);
                response.addCookie(ckuname);
                response.addCookie(ckpost);
                //  return "redirect:/admin/profile/remember";
            }
            request.getSession().setAttribute("uname", findUser.getUsername());
            request.getSession().setAttribute("post", findUser.getPost());
            return "redirect:/student/profile";
        }
        else{

            model.addAttribute("message", "Invalid UserId or Password.");
            return "/User/LogIn";
        }

    }



   /* @RequestMapping("/signup")
    public String signup() {

        return "/User/Sign";
    }*/

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String getsignup(Model model) {
        StudentSignupVM studentSignupVM = new StudentSignupVM();
        model.addAttribute("students", studentSignupVM);
        return "/User/Sign";
    }




    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String postsignup(@Valid @ModelAttribute("students") StudentSignupVM students, BindingResult bindingResult,  Model model) {
        if (bindingResult.hasErrors()) {
            return "/User/Sign";
        }
       // userContactService.save(userContact);
        User findUser= userService.get(students.getStudentID());
        User findStudent= userService.getemail(students.getEmail());
        if(findUser==null )
        {
            if(findStudent==null)
            {
                User user= new User();
                user.setUsername(students.getStudentID());
                user.setEmail(students.getEmail());
                user.setPassword(students.getPassword());
                user.setPost("STUDENT");
                user.setEnabled(true);
                userService.save(user);

                STUDENT student=new STUDENT();
                student.setStudentId(students.getStudentID());
                student.setFirstName(students.getFirstName());
                student.setLastName(students.getLastName());
                student.setGender(students.getGender());
                student.setEmail(students.getEmail());

                studentService.save(student);
                model.addAttribute("user", student);
                return "redirect:/home/signupsuccess";
            }
            else{

                model.addAttribute("message", "Already registered Email in our database.");
                return "/User/Sign";
            }

        }
        else{

            model.addAttribute("message", "Already registered ID in our database.");
            return "/User/Sign";
        }
    }


    @RequestMapping(value = "/signupsuccess")
    public String success(Model model) {

        return "/User/SignUpSuccess";

        //return "redirect:/home/togo";
    }

    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
    public String getforgotpassword(Model model) {
        ForgotPasswordVM forgotPasswordVM = new ForgotPasswordVM();
        model.addAttribute("forgotPasswordVM", forgotPasswordVM);
        return "/User/ForgotPassword";
    }

    @RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
    public String postforgotpassword(@Valid @ModelAttribute("forgotPasswordVM") ForgotPasswordVM forgotPasswordVM, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "/User/ForgotPassword";
        }



        if(forgotPasswordVM.getCode()==null)
        {
            if(forgotPasswordVM.getEmail()==null)
        {
            return "/User/ForgotPassword";
        }
            User user= userService.getemail(forgotPasswordVM.getEmail());

            if (user != null)
            {
                email=user.getEmail();
                OTP = new DecimalFormat("000000").format(new Random().nextInt(999999));

            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("system.confirmation.validity@gmail.com");
            message.setTo(user.getEmail());
            message.setSubject("Validation Message");
            message.setText("This is your validation code:"+OTP);
            emailSender.send(message);

                model.addAttribute("message", "");
                return "/User/ForgotPassword";

            }

            else
            {
                model.addAttribute("message", "This email is not registered in our database.");
                return "/User/ForgotPassword";

            }

        }
        else{

            if(forgotPasswordVM.getCode().equals(OTP)) {

                return "redirect:/home/changepassword";
            }
            else{
                model.addAttribute("message", "Invalid Code.");
                return "/User/ForgotPassword";

            }
        }

        // userContactService.save(userContact);

    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.GET)
    public String getchangepassword(Model model) {
        ForgotPasswordVM forgotPasswordVM = new ForgotPasswordVM();
        model.addAttribute("forgotPasswordVM", forgotPasswordVM);
        return "/User/ForgotChangePassword";
    }

    @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
    public String postchangepassword(@Valid @ModelAttribute("forgotPasswordVM") ForgotPasswordVM forgotPasswordVM, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "/User/ForgotChangePassword";
        }

        if(forgotPasswordVM.getPassword()==null||forgotPasswordVM.getNewPassword()==null)
        {
            model.addAttribute("message", "Password should not be empty");
            return "/User/ForgotChangePassword";
        }
        else{
            if(forgotPasswordVM.getPassword().equals(forgotPasswordVM.getNewPassword()))
            {
                User user= userService.getemail(email);
                user.setPassword(forgotPasswordVM.getPassword());
                userService.update(user);
                // userContactService.save(userContact);
                return "redirect:/home/togo";

            }
        }

        model.addAttribute("message", "New Password and Re-Typed Password must be same");
        return "/User/ForgotChangePassword";
    }


    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();

        Cookie ck=new Cookie("uname","");
        ck.setMaxAge(0);
        response.addCookie(ck);
        Cookie ck1=new Cookie("post","");
        ck1.setMaxAge(0);
        response.addCookie(ck1);

        return "redirect:/home/togo";
    }

    @RequestMapping("/about")
    public String about() {
        return "/User/About";
    }


}
