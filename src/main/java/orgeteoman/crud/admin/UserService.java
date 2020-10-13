package orgeteoman.crud.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import orgeteoman.crud.DTO.ProjectUserDTO;

@Service
@Repository
public class UserService {
	
	@Autowired
	private UserRepository repo;
	
	 public List<ProjectUserDTO> findAllProjectUsers(){
		 return repo.findAllProjectUsers();
	 }
	 public List<ProjectUserDTO> deleteProjectUserById(int id){
		 return repo.deleteProjectUserById(id);
	 }

    public List<User> listAll() {
        return repo.findAll();
    }
     
    public void save(User user) {
        repo.save(user);
    }
     
    public User get(int id) {
        return repo.findById(id).get();
    }
     
    public void delete(int id) {
        repo.deleteById(id);
    }

}
