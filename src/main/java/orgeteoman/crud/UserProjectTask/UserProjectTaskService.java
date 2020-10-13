package orgeteoman.crud.UserProjectTask;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Service
@Repository
public class UserProjectTaskService {
	
	@Autowired
	UserProjectTaskRepository repo;
	
    public List<UserProjectTask> listAll() {
        return repo.findAll();
    }
    
    public List<UserProjectTask> listAllById(int userId,int projectId) {
        return repo.listAllById(userId,projectId);
    }
   
    public void save(UserProjectTask userProjectTask) {
    	
        repo.save(userProjectTask);
        
    }
  
    public UserProjectTask get(int id) {
        return repo.findById(id).get();
    }
    
     
    public void delete(int id) {
        repo.deleteById(id);
    }
    
    public List<UserProjectTask> completedTasks(String state,int userId,int projectId){
    	
    	return repo.completedTasks(state,userId,projectId);
    }
  
    
    public List<UserProjectTask> completedTasksOnTime(String state,int userId,int projectId,String deadline){
    	
    	return repo.completedTasksOnTime(state,userId,projectId,deadline);
    }
    
    public List<UserProjectTask> completedTasksOutTime(String state,int userId,int projectId,String deadline){
    	return repo.completedTasksOutTime(state,userId,projectId,deadline);
    }
    
    public List<UserProjectTask> pendingState(String state,int userId,int projectId){
    	return repo.pendingState(state,userId,projectId);
    	
    }
    
    public List<UserProjectTask> listAllByName(String username){
    	
    	return repo.listAllByName(username);
    }
    

    public List<UserProjectTask> completedTaskOwn(String state,String username){
    	return repo.completedTaskOwn(state, username);
    }
	
	
    public List<UserProjectTask> completedTasksOnTimeOwn(String state,String username,String deadline){
    	return repo.completedTasksOnTimeOwn(state, username, deadline);
    }
	

    public List<UserProjectTask> completedTasksOutTimeOwn(String state,String username,String deadline){
    	return repo.completedTasksOutTimeOwn(state,username, deadline);
    }
	
	
    public List<UserProjectTask> pendingStateOwn(String state,String username){
    	return repo.pendingStateOwn(state, username);
    }
    
}
