# Create MCP Server

Create a Model Context Protocol (MCP) server compatible with Microsoft Copilot Studio, following proven patterns and avoiding common pitfalls.

## Critical Requirements

**MANDATORY**: This server MUST be compatible with Microsoft Copilot Studio limitations:
- NO optional parameters (all parameters must be required)
- NO complex types (list, dict, Union, Optional)
- Use "yes"/"no" strings instead of boolean true/false
- Maximum 70 tools total
- Ultra-clear descriptions with exact parameter counts

## Implementation Steps

1. **Reference Materials**
   - Study working examples in `~/projects/python-sdk`
   - Use mcp__ms-learn tool to verify latest documentation
   - Apply patterns from COPILOT_STUDIO_FIX.md experience

2. **Project Setup**
   - Create virtual environment (.venv)
   - Install FastMCP: `pip install fastmcp`
   - Set up project structure for MCP server

3. **Server Architecture**
   ```python
   from fastmcp import FastMCP
   
   mcp = FastMCP("Your Server Name")
   
   @mcp.tool()
   def simple_tool(required_param: str) -> str:
       """Tool description. 1 parameter: required_param."""
       return f"Result for {required_param}"
   ```

4. **Tool Design Principles**
   - Each tool has ONLY required parameters
   - Split complex tools into multiple simple tools
   - Use descriptive names indicating parameter count
   - Provide clear, specific descriptions

5. **Parameter Handling**
   ```python
   # ✅ CORRECT - All required parameters
   @mcp.tool()
   def create_document_with_title(filename: str, title: str) -> str:
       """Create document with title. 2 parameters: filename, title."""
   
   # ❌ WRONG - Optional parameter (breaks Copilot Studio)
   def create_document(filename: str, title: str = "") -> str:
   ```

6. **Tool Categories**
   - Demo tools (0 parameters) for testing connectivity
   - Simple operations (1-2 required parameters)
   - Complex operations split into multiple focused tools
   - Keep total under 70 tools

7. **Testing Strategy**
   - Test locally with JSON-RPC calls
   - Verify parameter display (not jsonrpc/method/arguments)
   - Test in Copilot Studio environment
   - Validate all tools work as expected

8. **Common Patterns**
   ```python
   # Demo connectivity
   @mcp.tool()
   def demo_hello_world() -> str:
       """Test MCP connection. No parameters needed."""
   
   # Simple operations
   @mcp.tool()
   def find_items(search_term: str) -> str:
       """Find items by search term. 1 parameter: search_term."""
   
   # Multiple variations instead of optional parameters
   @mcp.tool()
   def create_item(name: str) -> str:
       """Create item with default settings. 1 parameter: name."""
   
   @mcp.tool()
   def create_item_with_description(name: str, description: str) -> str:
       """Create item with description. 2 parameters: name, description."""
   ```

9. **Deployment Checklist**
   - [ ] No optional parameters anywhere
   - [ ] No complex types (list, dict, Union, Optional)
   - [ ] Tool count < 70
   - [ ] Boolean parameters use "yes"/"no" strings
   - [ ] Clear descriptions with parameter counts
   - [ ] Local testing successful
   - [ ] Reference examples verified

10. **Documentation**
    - Server purpose and capabilities
    - Tool descriptions and usage examples
    - Integration instructions for Copilot Studio
    - Troubleshooting common issues

Use the mcp-copilot-expert agent proactively throughout this process to ensure Copilot Studio compatibility and apply all learned lessons from previous implementations.