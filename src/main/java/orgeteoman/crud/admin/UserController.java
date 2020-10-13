package orgeteoman.crud.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import orgeteoman.crud.DTO.ProjectUserDTO;
import orgeteoman.crud.project.Project;
import orgeteoman.crud.project.ProjectService;


@Controller
public class UserController {
	
	
	@Autowired
	UserService service;
	
	@Autowired
	ProjectService projectService;

	@GetMapping("/projectUsers")
	public String testUsersProject(Model model) {
		
	    List<ProjectUserDTO> listUsers = service.findAllProjectUsers();
	    model.addAttribute("projectUserDTO", listUsers);
	     
	    return "projectMembers";
	    
	}

	@GetMapping("/deleteProjectUser")
	public String removeUserFromProject(@RequestParam("userId") int userId,@RequestParam("projectId") int projectId,
			Model model){

		
		Project theProject = projectService.get(projectId);
		User theUser = service.get(userId);
		theProject.removeUser(theUser);
		projectService.save(theProject);
	
	
    return "redirect:/";
}

	@GetMapping("/users")
	public String viewHomePage(Model model) {
	    List<User> listUsers = service.listAll();
	    model.addAttribute("users", listUsers);
	     
	    return "users";
	    
	}
	
	@GetMapping("/new")
	public String showNewUserPage(Model model) {
	    User user = new User();
	    model.addAttribute("user", user);
	     
	    return "new_user";
	}
	
	@PostMapping("/save")
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {       
	         
	        return "new_user";
	    } else {
	    	service.save(user);
	    }
		
	    return "redirect:/";
	}

	@GetMapping("/showformForUpdate")
	public String showFormForUpdate(@RequestParam("userId") int theId,Model theModel) {
		
		//get the user from the our service
		User theUser = service.get(theId);

		theModel.addAttribute("user",theUser);

		
		return "new_user";
		
	}
	
	@GetMapping("/delete")
	public String deleteUser(@RequestParam("userId") int theId) {
	
		service.delete(theId);

		return "redirect:/users";
		
	}

}
