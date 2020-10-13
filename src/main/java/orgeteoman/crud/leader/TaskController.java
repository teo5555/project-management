package orgeteoman.crud.leader;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import orgeteoman.crud.DTO.ProjectUserDTO;
import orgeteoman.crud.DTO.TaskUserDTO;
import orgeteoman.crud.UserProjectTask.UserProjectTaskService;
import orgeteoman.crud.admin.User;
import orgeteoman.crud.admin.UserService;
import orgeteoman.crud.project.Project;
import orgeteoman.crud.project.ProjectService;



@Controller
public class TaskController {
	
	@Autowired
	TaskService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	UserProjectTaskService userProjectTaskService;
	
	@GetMapping("/tasks")
	public String viewHomePageLeader(Model model) {
	    List<Task> listTasks = service.listAllTasksOrdered();
	    model.addAttribute("tasks", listTasks);
	     
	    return "tasks";
	    
	}
	
	@PostMapping("/saveTask")
	public String saveTask(@ModelAttribute("task") Task task) {
	    service.save(task);
	     
	    return "redirect:/";
	}

	@GetMapping("/deleteTask")
	public String deleteTask(@RequestParam("taskId") int theId) {
		
		//delete the task
		service.delete(theId);
	
		return "redirect:/tasks";
		
	}
	
	@GetMapping("/newTask")
	public String showNewTaskPage(Model model) {
	    Task task = new Task();
	    model.addAttribute("task", task);
	     
	    return "newTask";
	}

	@GetMapping("/tasksList")
	public String viewTasksListLeader(Model model) {
	    List<Task> listTasks = service.listAllTasksOrdered();
	    model.addAttribute("tasks", listTasks);
	     
	    return "tasksList";
	    
	}
	
	@GetMapping("/showAddProjectTask")
	public String showAddProjectTask(@RequestParam("userId") int userId,
			@RequestParam("projectId") int projectId,Model model,String roles
			) {
		
		User theUser = userService.get(userId);
		Project theProject = projectService.get(projectId);
		
		TaskUserDTO taskUserDTO = new TaskUserDTO();
		taskUserDTO.setUser(theUser);
		taskUserDTO.setUserId(userId);
		
		taskUserDTO.setProject(theProject);
		taskUserDTO.setProjectId(projectId);
		
		taskUserDTO.setTask(new Task());
		model.addAttribute("taskUser",taskUserDTO);
		
		
		roles="ROLE_MEMBER";
	    List<ProjectUserDTO> listUsers = service.findAllProjectUsersByLeader(roles);
	    model.addAttribute("projectUserByLeader", listUsers);
	    
	    List<Task> listTasks = service.listAllTasks();
	    model.addAttribute("tasks", listTasks);

	
		return "addTaskForProject";
	
	}
	
	@GetMapping("/showformForUpdateTask")
	public String showFormForUpdateTask(@RequestParam("taskId") int theId,Model theModel) {
	
		Task task = service.get(theId);
	
		theModel.addAttribute("task",task);

		return "newTask";
		
	}

}
