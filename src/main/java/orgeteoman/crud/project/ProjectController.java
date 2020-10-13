package orgeteoman.crud.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import orgeteoman.crud.DTO.ProjectUserDTO;
import orgeteoman.crud.admin.User;
import orgeteoman.crud.admin.UserService;
import orgeteoman.crud.leader.TaskService;


@Controller
public class ProjectController {
	

	@Autowired
	ProjectService projectService;
	
	@Autowired
	UserService serviceUser;
	
	@Autowired
	TaskService service;
	
	@GetMapping("/projects")
	public String viewHomePage(Model model) {
	    List<Project> listProjects = projectService.listAll();
	    model.addAttribute("projects", listProjects);
	     
	    return "projects";
	    
	}
	
	@GetMapping("/newProject")
	public String showNewProjectPage(Model model) {
	    Project project = new Project();
	    model.addAttribute("project", project);
	     
	    return "new_project";
	}
	
	@PostMapping("/saveProject")
	public String saveProject(@ModelAttribute("project") Project project) {
		projectService.save(project);
	     
	    return "redirect:/";
	}


	
	@GetMapping("/showAddProjectUser")
	public String showAddProjectUser(@RequestParam("projectId") int theId,Model model
			) {
		
		//get the project id from the our service
		Project theProject = projectService.get(theId);
		
		
		ProjectUserDTO projectUserDTO = new ProjectUserDTO();
		projectUserDTO.setProject(theProject);
		
		projectUserDTO.setProjectId(theId);
	
		
		projectUserDTO.setUser(new User());
		
		model.addAttribute("projectUser",projectUserDTO);
		
		 List<User> listUsers = serviceUser.listAll();
		 model.addAttribute("users", listUsers);
		
		return "addUserForProject";
		
	}
	

	
	@PostMapping("/saveUserProject")
	public String saveProjectUser(@RequestParam("user.id") int userId,@RequestParam("project.id") int projectId){
		
		Project theProject = projectService.get(projectId);
		User theUser = serviceUser.get(userId);
		theProject.addUser(theUser);
		projectService.save(theProject);
	
    return "redirect:/";
}

	
	@GetMapping("/showProjectUpdate")
	public String showFormForUpdate(@RequestParam("projectId") int theId,Model theModel) {
		
		//get the project from the our service
		Project theProject = projectService.get(theId);
		
		//set project as a model to pre-populate the form
		theModel.addAttribute("project",theProject);
		
		//send over to our form 
		
		return "new_project";
		
	}
	
	@GetMapping("/deleteProject")
	public String deleteProject(@RequestParam("projectId") int theId) {
		
		//delete the project
		projectService.delete(theId);
		 
		
		return "redirect:/projects";
		
	}
	//////////////////////////////////////
	

	
	@GetMapping("/projectUsersForLeader")
	public String usersProject(Model model,String roles) {
		roles="ROLE_MEMBER";
	    List<ProjectUserDTO> listUsers = service.findAllProjectUsersByLeader(roles);
	    model.addAttribute("projectUserByLeader", listUsers);
	     
	    return "projectMembersByLeader";
	    
	}
	
	@GetMapping("/projectsListMembers")
	public String projectsListMembers(Model model,String roles) {
		roles="ROLE_MEMBER";
	    List<ProjectUserDTO> listUsers = service.findAllProjectUsersListByLeader(roles);
	    model.addAttribute("projectUserByLeader", listUsers);
	     
	    return "projectsListByLeader";
	    
	}

	@GetMapping("/listUsersForLeader")
	public String viewUsers(Model model,String roles) {
		roles="ROLE_MEMBER";
	    List<User> listUsers = service.findUsersByRoles(roles);
	    model.addAttribute("listUsersForLeader", listUsers);
	     
	    return "listMembersByLeader";
	    
	}
	
	@GetMapping("/deleteProjectUserByLeader")
	public String removeUserFromProject(@RequestParam("userId") int userId,@RequestParam("projectId") int projectId,
			Model model){

		Project theProject = projectService.get(projectId);
		User theUser = serviceUser.get(userId);
		theProject.removeUser(theUser);
		projectService.save(theProject);
	
	
    return "redirect:/";
}
	
	@GetMapping("/showAddProjectUserByLeader")
	public String showAddProjectUser(@RequestParam("projectId") int theId,Model model
			,String roles) {
		
		roles="ROLE_MEMBER";
		
		Project theProject = projectService.get(theId);

		ProjectUserDTO projectUserDTO = new ProjectUserDTO();
		projectUserDTO.setProject(theProject);
		
		projectUserDTO.setProjectId(theId);
		
		projectUserDTO.setUser(new User());
		
		model.addAttribute("projectUser",projectUserDTO);
				 
		List<User> listUsers = service.findUsersByRoles(roles);
		model.addAttribute("users", listUsers);
		
		return "addUserForProjectByLeader";
		
	}
	
	@GetMapping("/projectsByLeader")
	public String projectsByLeader(Model model) {
	    List<Project> listProjects = projectService.listAll();
	    model.addAttribute("projects", listProjects);
	     
	    return "projectsByLeader";
	    
	}
	
	@PostMapping("/saveUserProjectByLeader")
	public String saveUserProjectByLeader(@RequestParam("user.id") int userId,@RequestParam("project.id") int projectId){
		
		Project theProject = projectService.get(projectId);
		User theUser = serviceUser.get(userId);
		theProject.addUser(theUser);
		projectService.save(theProject);
	
    return "redirect:/";
}
	

}
