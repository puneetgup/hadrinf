# High Availability - Disaster Recovery Guidance 
### Design for High Availability
Designing for High Availability focuses on ensuring that the Azure Solution you are building and deploying is available to withstand network, hardware and software failures to meet the uptime requirements for your solution
### Design for Disaster Recovery
Designing for Disaster Recovery focuses on how quickly your solution can recover from any disaster impacting the infrastructure your solution is hosted on and minimizing any data loss related to this disaster. The design needs to consider regional failure for your solution infrastructure and recovering to another region to meet the availability requirements for your solution
## Reference Architecture for Azure Express Route High availability with multi-region failover
Azure ExpressRoute lets you extend your on-premises networks into Microsoft Azure over a private connection facilitated by a network connectivity provider. Connectivity can be from any-to-any network, a point-to-point Ethernet network, or a virtual cross-connection through a connectivity provider at a co-location facility. ExpressRoute is designed for high availability to provide carrier grade private network connectivity to Microsoft resources, with no single point of failure in the ExpressRoute path within the Microsoft network. To maximize the availability, the customer and the service provider segment of your ExpressRoute circuit should also be architected for high availability. While there are multiple topologies for connectivity with Azure, one of the most frequently used topology is the Hub-Spoke Topology. The Hub is a virtual network (VNet) in Azure that acts as a central point of connectivity to your on-premises network. The spokes are VNets that peer with the hub, and can be used to isolate workloads. Traffic flows between the on-premises datacenter and the hub through Express Route circuits or VPN Gateway connections. This kind of topology can provide cost benefits by centralizing shared services that may be shared across the various spokes. Detailed information is out of scope for this document and can be found at https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/shared-services

Reference Visio TBD - Describe the visio which will have dual Hub and Spoke for the 2 regions, with the Hub front ending Azure Firewall with NSG's and UDR's
### Scenario 1:
1. AFD with WAF to AppGW to App Services in each region
2. App Services (in order to effectively use Cosmos Private Link, let's use the ASE) is Hello World with the words Hello World as text in a multi-region Cosmos database to demonstrate multi-master - Cosmos enabled with Private Link perhaps?
3. App Services Hello World also calls "on prem" via ER (or the VPN failover) for something, maybe another line of text that says "I'm on prem and routing via (ER or VPN)"
### Scenario 2:
1. On premise, the customer uses VMWare and we'll use the HA setup to fail over from on premise to Azure
2. Hybrid with primary on prem and secondary in Azure with the same application approach as Scenario 1, instead of ASE and Cosmos, use VMs.
