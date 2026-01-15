# Security Review

Comprehensive security audit of codebase focusing on vulnerabilities, best practices, and compliance requirements.

## Security Review Scope

Perform thorough security analysis covering:
- Input validation and sanitization
- Authentication and authorization mechanisms
- Data protection and encryption
- API security and rate limiting
- Dependencies and supply chain security
- Configuration and secrets management
- Error handling and information disclosure
- Infrastructure and deployment security

## Review Process

1. **Static Code Analysis**
   - Run security linters (bandit for Python, ESLint security for JS/TS)
   - Check for hardcoded secrets and credentials
   - Analyze SQL injection and XSS vulnerabilities
   - Review file upload and download mechanisms
   - Validate input sanitization patterns

2. **Dependencies Audit**
   - Check for known vulnerabilities in dependencies
   - Verify dependency sources and integrity
   - Review package-lock files for suspicious changes
   - Analyze third-party service integrations

3. **Authentication & Authorization**
   - Review authentication flows and session management
   - Validate JWT token handling and storage
   - Check authorization controls and access permissions
   - Analyze password policies and storage
   - Review multi-factor authentication implementation

4. **Data Protection**
   - Verify encryption at rest and in transit
   - Check PII handling and GDPR compliance
   - Review data retention and deletion policies
   - Validate backup and recovery security
   - Analyze logging and audit trail implementation

5. **API Security**
   - Review rate limiting and throttling
   - Check CORS configuration
   - Validate input validation on all endpoints
   - Analyze error responses for information leakage
   - Review API versioning and backward compatibility

6. **Configuration Security**
   - Check environment variable usage
   - Review production vs development configurations
   - Validate secrets management implementation
   - Analyze docker and deployment configurations
   - Check file permissions and access controls

7. **Infrastructure Review**
   - Review cloud security configurations
   - Check network security and firewall rules
   - Validate SSL/TLS configurations
   - Analyze monitoring and alerting setup
   - Review backup and disaster recovery plans

## Security Standards

Apply industry security standards:
- OWASP Top 10 compliance
- NIST Cybersecurity Framework
- ISO 27001 controls where applicable
- Language-specific security guidelines
- Cloud provider security best practices

## Deliverables

Generate comprehensive security report including:
- Executive summary with risk assessment
- Detailed findings with severity levels (Critical, High, Medium, Low)
- Specific remediation recommendations
- Compliance checklist and gap analysis
- Implementation timeline and priorities

## Tools and Automation

Leverage security tools:
- Static analysis: bandit, semgrep, CodeQL
- Dependency scanning: safety, npm audit, Snyk
- Container scanning: trivy, clair
- Infrastructure: terraform security scanning
- Runtime protection: monitoring and alerting

Focus on actionable findings with clear remediation steps and business impact assessment.