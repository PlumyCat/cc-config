# Debug MCP Server

Systematic debugging workflow for MCP (Model Context Protocol) server issues, especially for Microsoft Copilot Studio integration problems.

## Common Issues

**Copilot Studio shows JSON-RPC parameters instead of tool parameters:**
- Usually caused by optional parameters in tool definitions
- Check for any parameters with default values
- Verify no Union, Optional, or complex types are used

**Tools not appearing in Copilot Studio:**
- Server may not be responding to list_tools requests
- Check server startup and connection logs
- Verify MCP protocol compliance

**Tool execution fails:**
- Parameter type mismatches
- Server runtime errors
- Network connectivity issues

## Debugging Steps

1. **Check Server Status**
   - Verify server starts without errors
   - Test basic connectivity with demo tools
   - Check server logs for startup issues

2. **Validate Tool Definitions**
   - Search for optional parameters: `grep -r "= " server.py`
   - Check for complex types: `grep -r "Optional\|Union\|List\|Dict" server.py`
   - Verify parameter count matches descriptions

3. **Test JSON-RPC Protocol**
   - Test list_tools request manually
   - Verify tool schemas in response
   - Check parameter definitions in tool schemas

4. **Reference Working Examples**
   - Compare with `~/projects/python-sdk` examples
   - Check COPILOT_STUDIO_FIX.md for known solutions
   - Use mcp__ms-learn to verify documentation

5. **Common Fixes**
   ```python
   # ❌ PROBLEMATIC - Optional parameter
   def broken_tool(name: str, option: str = "default"):
       """This breaks Copilot Studio."""
   
   # ✅ FIXED - Split into separate tools
   def working_tool(name: str):
       """Working tool. 1 parameter: name."""
       return process_with_option(name, "default")
   
   def working_tool_with_option(name: str, option: str):
       """Working tool with option. 2 parameters: name, option."""
       return process_with_option(name, option)
   ```

6. **Systematic Testing**
   - Test each tool individually in Copilot Studio
   - Verify parameter display shows real parameters
   - Check tool execution with various inputs
   - Validate error handling and responses

7. **Server Optimization**
   - Ensure tool count stays under 70
   - Optimize tool descriptions for clarity
   - Remove unused or redundant tools
   - Group related functionality appropriately

## Debugging Tools

**Local Testing:**
```bash
# Test server startup
python your_mcp_server.py

# Test JSON-RPC manually
curl -X POST http://localhost:port/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc": "2.0", "method": "tools/list", "id": 1}'
```

**Code Analysis:**
```bash
# Find optional parameters
grep -n "=" server.py | grep -v "=="

# Find complex types
grep -n "Optional\|Union\|List\|Dict" server.py

# Count tools
grep -c "@mcp.tool" server.py
```

**Log Analysis:**
- Check server startup logs
- Monitor tool execution logs
- Review Copilot Studio integration logs

## Resolution Checklist

- [ ] No optional parameters in any tool
- [ ] No complex types (list, dict, Union, Optional)
- [ ] Tool count < 70
- [ ] Boolean parameters use "yes"/"no" strings
- [ ] Clear descriptions with parameter counts
- [ ] Server starts without errors
- [ ] JSON-RPC responses are valid
- [ ] Tools execute successfully in Copilot Studio

Use the mcp-copilot-expert agent proactively during debugging to apply all known solutions and best practices.