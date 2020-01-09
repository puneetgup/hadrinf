# High Availability - Disaster Recovery Guidance using practical real life scenarios
### Design for High Availability
Designing for High Availability focuses on ensuring that the Azure Solution you are building and deploying is available to withstand network, hardware and software failures to meet the uptime requirements for your solution
### Design for Disaster Recovery
Designing for Disaster Recovery focuses on how quickly your solution can recover from any disaster impacting the infrastructure your solution is hosted on and minimizing any data loss related to this disaster. The design needs to consider regional failure for your solution infrastructure and recovering to another region to meet the availability requirements for your solution
## Scenario for High availability with multi-region failover.
1. Express Route to on premise from primary Azure region
2. Express Route failover VPN in secondary Azure region
3. Azure Hub/Spoke with the Hub being a dedicated subscription and peers to spoke subscriptions of Production and Not Production (connecting both primary and secondary region)
4. Placement of Azure Firewall, NSGs, UDRs to protect inbound and outbound traffic (shaping, not forced tunneling).
### Scenario 1:
1. AFD with WAF to AppGW to App Services in each region
2. App Services (in order to effectively use Cosmos Private Link, let's use the ASE) is Hello World with the words Hello World as text in a multi-region Cosmos database to demonstrate multi-master - Cosmos enabled with Private Link perhaps?
3. App Services Hello World also calls "on prem" via ER (or the VPN failover) for something, maybe another line of text that says "I'm on prem and routing via (ER or VPN)"
### Scenario 2:
1. On premise, the customer uses VMWare and we'll use the HA setup to fail over from on premise to Azure
2. Hybrid with primary on prem and secondary in Azure with the same application approach as Scenario 1, instead of ASE and Cosmos, use VMs.
