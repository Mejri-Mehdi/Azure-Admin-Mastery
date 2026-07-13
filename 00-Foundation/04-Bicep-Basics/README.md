# Bicep vs ARM Templates

**Bicep** is a domain-specific language (DSL) that compiles down to Azure Resource Manager (ARM) JSON templates. It simplifies authoring by offering cleaner syntax, better type safety, and modularity.

| Aspect               | Bicep                                                           | ARM JSON                                                       |
|----------------------|-----------------------------------------------------------------|----------------------------------------------------------------|
| **Format**           | Concise, declarative language                                   | Verbose JSON with many arrays/objects                          |
| **Authoring**        | Less code, no explicit API versions or schema                   | Must specify schema, API versions, and use complex expressions |
| **Readability**      | Human‑friendly, resembles a programming language                | Harder to read and maintain due to nested JSON                 |
| **Module support**   | Native `module` keyword                                         | Linked templates (nested)                                      |
| **Deployment**       | Transpiled to ARM JSON before deployment                        | Directly consumed by Azure                                     |
| **Tooling**          | VS Code extension with IntelliSense, linting                    | Validation via `az deployment group validate`                  |
| **Functions**        | Reuse ARM template functions (`resourceGroup().location`, etc.) | Same functions in JSON expressions                             |
| **Parameter handling**| Optional default values, simple syntax                         | Requires `defaultValue` in parameters section                  |

**Key takeaway**: Bicep makes infrastructure as code more accessible and maintainable, without losing the power of ARM. You still deploy ARM templates under the hood.

## Overview
This project introduces **Bicep**, a domain-specific language (DSL) for Azure Resource Manager (ARM).  
It demonstrates creating a reusable template to deploy a Storage Account with parameters and outputs.

---

## Steps Completed
1. Installed Bicep CLI (`az bicep install`).  
2. Authenticated and prepared resource group.  
3. Authored `main.bicep` with parameters for name, location, and SKU.  
4. Deployed template via `az deployment group create`.  
5. Compiled Bicep to ARM JSON (`main.json`).  
6. Observed output: Blob storage endpoint.

---

## Key Concepts
- **Bicep DSL** → Simplifies authoring compared to raw ARM JSON.  
- **Compilation** → Bicep compiles down to ARM templates.  
- **Parameters** → Make templates reusable across environments.  
- **Functions** → `resourceGroup().location` dynamically sets location.  
- **Outputs** → Expose useful values (e.g., storage endpoint).

---

## Deliverables
- **main.bicep** → Source template.  
- **main.json** → Compiled ARM template.  
- **deploy.sh** → Deployment script.  
- **README.md** → Documentation and explanation.

---

## Lessons Learned
- Bicep is more concise and readable than ARM JSON.  
- ARM templates remain the execution format, ensuring compatibility.  
- Parameters and outputs make templates flexible and informative.  

---

## Next Steps
- Add more resources (e.g., Virtual Network, VM).  
- Explore modules for reusable components.  
- Integrate with CI/CD pipelines for automated deployments.