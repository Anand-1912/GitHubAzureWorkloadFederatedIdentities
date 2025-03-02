# GitHubAzureWorkloadFederatedIdentities

You're right to point out that my previous explanation might have been unclear. Let me clarify the entire authentication flow, especially in relation to the **first request** and the **use of tokens**.

### Flow Clarification:

In the context of **Azure Federation Identity** and **GitHub Actions**, the **first request** from GitHub to Azure AD does indeed involve **sending a token** (but it's not an Azure access token). The key token in this request is a **JWT token issued by GitHub's OIDC service**.

Here’s how it works, step by step, and where tokens come into play:

### 1. **GitHub Actions Initiates Authentication with Azure AD**

- When a GitHub Actions workflow starts, the first thing it does is **authenticate to Azure AD** using **OIDC** (OpenID Connect).
- GitHub doesn’t have any Azure access tokens at this point, but it needs to authenticate itself to Azure AD in order to obtain one.

### 2. **GitHub Sends an OIDC Token to Azure AD**

- GitHub Actions sends an **OIDC token request** to Azure AD.
- The **issuer** for this token is GitHub's OIDC service (`https://token.actions.githubusercontent.com`), which is essentially GitHub acting as an **identity provider**.

So, **GitHub does send a token** in the form of a **JWT** (JSON Web Token) issued by its OIDC service, not an Azure access token.

### 3. **Azure AD Validates the Token**

- Azure AD checks the incoming **OIDC token** from GitHub for authenticity.
- It verifies the **issuer** (`https://token.actions.githubusercontent.com`), which is a GitHub URL, ensuring that the token was issued by GitHub's OIDC service.
- Azure AD then confirms that the GitHub Actions workflow is authorized to request an access token.

### 4. **Azure AD Issues an Access Token**

- After successfully validating the OIDC token, **Azure AD issues an Azure access token**. This is the token GitHub Actions will use for subsequent requests to Azure resources (like creating or managing infrastructure).

### 5. **GitHub Uses the Access Token for Azure Resource Management**

- Once the access token is issued, GitHub can use it to make authenticated requests to Azure's APIs (such as **Azure Resource Manager**), allowing the workflow to deploy resources or manage configurations on Azure.

---

### Key Points:

- **First request**: GitHub does send a **JWT token** issued by **GitHub's OIDC service** (`https://token.actions.githubusercontent.com`).
- This **JWT token** is not an **Azure access token**. Instead, it's an **identity token** used to authenticate GitHub to Azure AD.
- **Azure AD** validates this token, and if valid, issues an **Azure access token** that GitHub can use to access Azure resources.

---

### Why is this important?

- The first request to Azure AD involves the **OIDC token from GitHub** that proves GitHub's identity. This is critical because, without this token, Azure AD wouldn't know which identity (GitHub Actions) is making the request.
- The **issuer URL (`https://token.actions.githubusercontent.com`)** is how Azure AD identifies that the request is coming from a trusted source—GitHub.
