package orgeteoman.crud.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository
public class ProjectService {

	@Autowired
	private ProjectRepository repo;
	
	
    public List<Project> listAll() {
        return repo.findAll();
    }
     
    public void save(Project project) {
        repo.save(project);
        
    }
 
    public Project get(int id) {
        return repo.findById(id).get();
    }
     
    public void delete(int id) {
        repo.deleteById(id);
    }
}
	

