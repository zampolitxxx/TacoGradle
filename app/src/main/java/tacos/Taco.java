package tacos;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import java.util.List;


@Data
public class Taco {
    @NotNull
    @Size(min = 2, max = 50, message = "It should be between 2 and 50")
    private String name;
    private List<Ingredient> ingredients;
}
